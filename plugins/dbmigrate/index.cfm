<cfsetting enablecfoutputonly="true">

<cfif isDefined("Form.version")>
	<cfset flashInsert(DBMigrateFeedback=application.wheels.plugins.DBMigrate.migrateTo(Form.version))>
	<cfset redirectTo(back=true)>
<cfelseif isDefined("Form.migrationName")>
	<cfparam name="Form.templateName" default="">
	<cfparam name="Form.migrationPrefix" default="">
	<cfset flashInsert(DBMigrateFeedback2=application.wheels.plugins.DBMigrate.createMigration(Form.migrationName,Form.templateName,Form.migrationPrefix))>
	<cfset redirectTo(back=true)>
</cfif>

<!--- Get current database version --->
<cfset currentVersion = application.wheels.plugins.DBMigrate.getCurrentMigrationVersion()>

<!--- Get current list of migrations --->
<cfset migrations = application.wheels.plugins.DBMigrate.getAvailableMigrations()>
<cfif ArrayLen(migrations)>
	<cfset lastVersion = migrations[ArrayLen(migrations)].version>
<cfelse>
	<cfset lastVersion = 0>
</cfif>

<cfoutput>

<cfinclude template="css.cfm">

<h1>DBMigrate</h1>
<h2>inspired by Active Record migrations</h2>
<p>Database Migrations are an easy way to build and alter your database structure using cfscript.</p>

<cfif flashKeyExists("DBMigrateFeedback")>
	<h2>Migration result</h2>
	<pre>#flash("DBMigrateFeedback")#</pre>
</cfif>

<h2>Datasource</h2>
<p>Current datasource is <strong>#application.wheels.dataSourceName#</strong></p>

<h2>Current version</h2>
<p>Current database version is <strong>#currentVersion#</strong></p>

<cfif ArrayLen(migrations) gt 0>
	<h2>Migrate</h2>
	<form action="#CGI.script_name & '?' & CGI.query_string#" method="post">
	<p>Migrate to version
	<select name="version">
	<cfif lastVersion neq 0><option value="#lastVersion#" selected="selected">All non-migrated</option></cfif>
	<cfif currentVersion neq "0"><option value="0">0 - empty</option></cfif>
	<cfloop array="#migrations#" index="migration">
	<option value="#migration.version#">#migration.version# - #migration.name# <cfif migration.status eq "migrated">(migrated)<cfelse>(not migrated)</cfif></option>
	</cfloop>
	</select>
	<input type="submit" value="go">
	</p>
	</form>

	<!--- List migrations available --->
	<h2>Available migrations</h2>
	<p>
	<cfloop array="#migrations#" index="migration">
		<span<cfif migration.status eq "migrated"> style="font-weight:bold;"</cfif>>
			#migration.version# - #migration.name#
			<cfif migration.loadError neq ""> (load error: #migration.loadError#)</cfif>
			<cfif migration.details neq ""> (#migration.details#)</cfif>
			- <em><cfif migration.status eq "migrated">migrated<cfelse>not migrated</cfif></em>
		</span><br />
	</cfloop>
	</p>
</cfif>

	<h2 style="padding-top:10px;">Create new migration file from template</h2>
	
	<cfif flashKeyExists("DBMigrateFeedback2")>
	<pre style="margin-top:10px;">#flash("DBMigrateFeedback2")#</pre>
	</cfif>
	
	<form action="#CGI.script_name & '?' & CGI.query_string#" method="post">
	<p style="padding-top:10px;">Select template:
	<select name="templateName">
	 <option value="blank">Blank migration</option>
	 <option value="create-table">Create table</option>
	 <option value="change-table">Change table</option>
	</select>
	</p>
	
	<cfif ArrayLen(migrations) eq 0>
	<p>Migration prefix:
	<select name="migrationPrefix">
	 <option value="timestamp">Timestamp (e.g. #dateformat(now(),'yyyymmdd')##timeformat(now(),'hhmmss')#)</option>
	 <option value="numeric">Numeric (e.g. 001)</option>
	</select>
	</p>
	</cfif>
	
	<p>Migration description: 
	<input name="migrationName" type="text" size="30">
	(eg. 'creates member table') </p>
	<p><input type="submit" value="create"></p>
	</form>

</cfoutput>

<cfsetting enablecfoutputonly="false">