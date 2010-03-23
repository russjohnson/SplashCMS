<cfcomponent output="false" mixin="none" environment="design,development,maintenance">
	
	<cffunction name="init">
		<cfset this.version = "1.0">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="migrateTo" access="public" returntype="string" hint="migrates database to a specified version">
		<cfargument name="version" type="string" required="false" default="">
		<cfset var loc = {}>
		<cfset loc.feedback = "">
		<cfset loc.versionsCurrentlyMigrated = $getVersionsPreviouslyMigrated()>
		<cfset loc.currentVersion = ListLast(loc.versionsCurrentlyMigrated)>
		<cfif loc.currentVersion eq arguments.version>
			<cfset loc.feedback = "Database is currently at version #arguments.version#. No migration required.#chr(13)#">
		<cfelse>
			<cfset loc.sqlPath = expandPath("db/sql")>
			<cfif not DirectoryExists(loc.sqlPath)>
				<cfdirectory action="create" directory="#loc.sqlPath#">
			</cfif>
			<cfset loc.migrations = getAvailableMigrations()>
			<cfif loc.currentVersion gt arguments.version>
				<cfset loc.feedback = "Migrating from #loc.currentVersion# down to #arguments.version#.#chr(13)#">
				<cfloop index="loc.i" from="#ArrayLen(loc.migrations)#" to="1" step="-1">
					<cfset loc.migration = loc.migrations[loc.i]>
					<cfif loc.migration.version lte arguments.version><cfbreak></cfif>
					<cfif loc.migration.status eq "migrated">
						<cftransaction action="begin">
							<cftry>
								<cfset loc.feedback = loc.feedback & "#chr(13)#------- " & loc.migration.cfcfile & " #RepeatString("-",50-Len(loc.migration.cfcfile))##chr(13)#">
								<cfset Request.migrationOutput = "">
								<cfset Request.migrationSQLFile = "#loc.sqlPath#/#loc.migration.cfcfile#_down.sql">
								<cffile action="write" file="#Request.migrationSQLFile#" output="">
								<cfset loc.migration.cfc.down()>
								<cfset loc.feedback = loc.feedback & Request.migrationOutput>
								<cfset $removeVersionAsMigrated(loc.migration.version)>
								<cfcatch type="any">
									<cfset loc.feedback = loc.feedback & "Error migrating to #loc.migration.version#.#chr(13)##CFCATCH.Message##chr(13)##CFCATCH.Detail##chr(13)#">
									<cftransaction action="rollback" />
									<cfbreak>
								</cfcatch>
							</cftry>
							<cftransaction action="commit" />
						</cftransaction>
					</cfif>
				</cfloop>
			<cfelse>
				<cfset loc.feedback = "Migrating from #loc.currentVersion# up to #arguments.version#.#chr(13)#">
				<cfloop index="loc.i" from="1" to="#ArrayLen(loc.migrations)#">
					<cfset loc.migration = loc.migrations[loc.i]>
					<cfif loc.migration.version lte arguments.version and loc.migration.status neq "migrated">
						<cftransaction action="begin">
							<cftry>
								<cfset loc.feedback = loc.feedback & "#chr(13)#-------- " & loc.migration.cfcfile & " #RepeatString("-",50-Len(loc.migration.cfcfile))##chr(13)#">
								<cfset Request.migrationOutput = "">
								<cfset Request.migrationSQLFile = "#loc.sqlPath#/#loc.migration.cfcfile#_up.sql">
								<cffile action="write" file="#Request.migrationSQLFile#" output="">
								<cfset loc.migration.cfc.up()>
								<cfset loc.feedback = loc.feedback & Request.migrationOutput>
								<cfset $setVersionAsMigrated(loc.migration.version)>
								<cfcatch type="any">
									<cfset loc.feedback = loc.feedback & "Error migrating to #loc.migration.version#.#chr(13)##CFCATCH.Message##chr(13)##CFCATCH.Detail##chr(13)#">
									<cftransaction action="rollback" />
									<cfbreak>
								</cfcatch>
							</cftry>
							<cftransaction action="commit" />
						</cftransaction>
					<cfelseif loc.migration.version gt arguments.version>
						<cfbreak>			
					</cfif>
				</cfloop>
			</cfif>
		</cfif>
		<cfreturn loc.feedback>
	</cffunction>
	
	<cffunction name="getCurrentMigrationVersion" access="public" returntype="string" hint="returns current database version">
		<cfset var loc = {}>
		<cfset loc.listPreviouslyMigratedVersions = $getVersionsPreviouslyMigrated()>
		<cfreturn ListLast(loc.listPreviouslyMigratedVersions)>
	</cffunction>
	
	<cffunction name="getAvailableMigrations" access="public" returntype="array" hint="searches db/migrate folder for migrations">
		<cfset var loc = {}>
		<cfset loc.listVersionsPreviouslyMigrated = $getVersionsPreviouslyMigrated()>
		<cfset loc.migrations = ArrayNew(1)>
		<cfset loc.migrationRE = "^([\d]{3,14})_([^\.]*)\.cfc$">
		<cfset loc.migrationsPath = expandPath("db/migrate")>
		<cfif not DirectoryExists(loc.migrationsPath)>
			<cfdirectory action="create" directory="#loc.migrationsPath#">
		</cfif>
		<cfdirectory action="list" name="qMigrationFiles" directory="#loc.migrationsPath#" sort="Name" filter="*.cfc" type="file" />
		<cfloop query="qMigrationFiles">
			<cfif REFind(loc.migrationRE,Name)>
				<cfset loc.migration = {}>
				<cfset loc.migration.version = REReplace(Name,loc.migrationRE,"\1")>
				<cfset loc.migration.name = REReplace(Name,loc.migrationRE,"\2")>
				<cfset loc.migration.cfcfile = REReplace(Name,loc.migrationRE,"\1_\2")>
				<cfset loc.migration.loadError = "">
				<cfset loc.migration.details = "description unavailable">
				<cfset loc.migration.status = "">
				<cftry>
					<cfset loc.migration.cfc = $createObjectFromRoot(path="db.migrate",fileName=loc.migration.cfcfile, method="init")>
					<cfset loc.metaData = GetMetaData(loc.migration.cfc)>
					<cfif structKeyExists(loc.metaData,"hint")>
						<cfset loc.migration.details = loc.metaData.hint>
					</cfif>
					<cfif ListFind(loc.listVersionsPreviouslyMigrated, loc.migration.version) neq 0>
						<cfset loc.migration.status = "migrated">
					</cfif>
					<cfcatch type="any"><cfset loc.migration.loadError = CFCATCH.Message></cfcatch>
				</cftry>
				<cfset ArrayAppend(loc.migrations,loc.migration)>
			</cfif>
		</cfloop>
		<cfreturn loc.migrations>
	</cffunction>
	
	<cffunction name="createMigration" access="public" returntype="string">
		<cfargument name="migrationName" type="string" required="true" />
		<cfargument name="templateName" type="string" required="false" default="blank" />
		<cfargument name="migrationPrefix" type="string" required="false" default="timestamp" />
		<cfif len(trim(arguments.migrationName)) gt 0>
			<cfreturn $copyTemplateMigrationAndRename(argumentCollection=arguments)>
		<cfelse>
			<cfreturn "You must supply a migration name (e.g. 'creates member table')">
		</cfif>
	</cffunction>
	
	<cffunction name="$setVersionAsMigrated" access="private">
		<cfargument name="version" required="true" type="string">
		<cfquery datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#">
		INSERT INTO schemainfo (version) VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.version#">)
		</cfquery>
	</cffunction>
	
	<cffunction name="$removeVersionAsMigrated" access="private">
		<cfargument name="version" required="true" type="string">
		<cfquery datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#">
		DELETE FROM schemainfo WHERE version = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.version#">
		</cfquery>
	</cffunction>	
	
	<!--- this function copied from /wheels/global/internal.cfm  --->
	<cffunction name="$createObjectFromRoot" returntype="any" access="private" output="false">
		<cfargument name="path" type="string" required="true">
		<cfargument name="fileName" type="string" required="true">
		<cfargument name="method" type="string" required="true">
		<cfscript>
			var loc = {};
			arguments.returnVariable = "loc.returnValue";
			arguments.component = arguments.path & "." & arguments.fileName;
			StructDelete(arguments, "path");
			StructDelete(arguments, "fileName");
		</cfscript>
		<cfinclude template="../../root.cfm">
		<cfreturn loc.returnValue>
	</cffunction>

	<cffunction name="$copyTemplateMigrationAndRename" displayname="$copyTemplateMigrationAndRename" access="private" returntype="string">
		<cfargument name="migrationName" type="string" required="true" />
		<cfargument name="templateName" type="string" required="true" />
		<cfargument name="migrationPrefix" type="string" required="false" default="" />
		<cfset var loc = {}>
		<cfset loc.migrationsPath = expandPath("db/migrate")>
		<cfset loc.templateFile = expandPath("plugins/dbmigrate/templates") & "/" & arguments.templateName & ".cfc">
		<cfif not FileExists(loc.templateFile)>
			<cfreturn "Template #arguments.templateName# could not be found">
		</cfif>
		<cfif not DirectoryExists(loc.migrationsPath)>
			<cfdirectory action="create" directory="#loc.migrationsPath#">
		</cfif>
		<cftry>
			<cffile action="read" file="#loc.templateFile#" variable="loc.templateContent">
			
			<!--- TODO: need to determine if app sits in subfolder under webroot and needs different extends path --->
			<cfset loc.templateContent = replace(loc.templateContent, "[extends]", "plugins.dbmigrate.Migration")>
			
			<cfset loc.templateContent = replace(loc.templateContent, "[description]", arguments.migrationName)>
			
			<cfset loc.migrationFile = $getNextMigrationNumber() & "_#REREplace(arguments.migrationName,"[\s]+","_","ALL")#.cfc">
			
			<cffile action="write" file="#loc.migrationsPath#/#loc.migrationFile#" output="#loc.templateContent#">
			
			<cfcatch type="any">
				<cfreturn "There was an error when creating the migration: #cfcatch.message#">
			</cfcatch>
		</cftry>
		<cfreturn "The migration #loc.migrationFile# file was created" />
	</cffunction>

	<cffunction name="$getNextMigrationNumber" returntype="string">
		<cfargument name="migrationPrefix" type="string" required="false" default="" />
		<cfscript>
			var loc = {};
			loc.migrationNumber = dateformat(now(),'yyyymmdd') & timeformat(now(),'hhmmss');
			if(arguments.migrationPrefix != "timestamp") {
				loc.migrations = getAvailableMigrations();
				if(ArrayLen(loc.migrations) eq 0) {
					if(arguments.migrationPrefix == "numeric") {
						loc.migrationNumber = "001";
					}
				} else {
					// determine current numbering system
					loc.lastMigration = loc.migrations[ArrayLen(loc.migrations)];
					if(Len(loc.lastMigration.version) eq 3) {
						// use numeric numbering
						loc.migrationNumber = NumberFormat(Val(loc.lastMigration.version)+1,"009");
					}
				}
			}
		</cfscript>
		<cfreturn loc.migrationNumber>
	</cffunction>
	
	<cffunction name="$getVersionsPreviouslyMigrated" access="private" returntype="string">
		<cfset var loc = {}>
		<cftry>
			<cfquery name="loc.qMigratedVersions" datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#">
			SELECT version FROM schemainfo ORDER BY version ASC
			</cfquery>
			<cfcatch type="database">
				<cfquery datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#">
				CREATE TABLE schemainfo (version VARCHAR(25))
				</cfquery>
				<cfreturn "0">
			</cfcatch>
		</cftry>
		<cfif loc.qMigratedVersions.recordcount eq 0>
			<cfreturn "0">
		<cfelse>
			<cfreturn ValueList(loc.qMigratedVersions.version)>
		</cfif>
	</cffunction>

</cfcomponent>