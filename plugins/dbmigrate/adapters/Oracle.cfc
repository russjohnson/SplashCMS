<cfcomponent extends="Abstract">

	<!--- note that for oracle primary keys we add sequences [tablename_seq]
		  but we leave it up to the model to implement a beforeCreate() callback
		  that sets the id value based on the next value in the sequence --->

	<cfset variables.sqlTypes = {}>
	<cfset variables.sqlTypes['primaryKey'] = "NUMBER(38) NOT NULL PRIMARY KEY">
	<cfset variables.sqlTypes['binary'] = {name='BLOB'}>
	<cfset variables.sqlTypes['boolean'] = {name='NUMBER',limit=1}>
	<cfset variables.sqlTypes['date'] = {name='DATE'}>
	<cfset variables.sqlTypes['datetime'] = {name='DATE'}>
	<cfset variables.sqlTypes['decimal'] = {name='DECIMAL'}>
	<cfset variables.sqlTypes['float'] = {name='NUMBER'}>
	<cfset variables.sqlTypes['integer'] = {name='NUMBER',limit=38}>
	<cfset variables.sqlTypes['string'] = {name='VARCHAR2',limit=255}>
	<cfset variables.sqlTypes['text'] = {name='CLOB'}>
	<cfset variables.sqlTypes['time'] = {name='DATE'}>
	<cfset variables.sqlTypes['timestamp'] = {name='DATE'}>

	<cffunction name="adapterName" returntype="string" access="public" hint="name of database adapter">
		<cfreturn "Oracle">
	</cffunction>

	<!--- currently leaving table names and columns unquoted
		  my understanding is that if you use quotes when creating the tables,
		  it becomes case sensitive & maybe you also need to use quotes in your queries --->
	<cffunction name="quoteTableName" returntype="string" access="public" hint="surrounds table or index names with quotes">
		<cfargument name="name" type="string" required="true" hint="column name">
		<cfreturn arguments.name>
	</cffunction>

	<cffunction name="quoteColumnName" returntype="string" access="public" hint="surrounds column names with quotes">
		<cfargument name="name" type="string" required="true" hint="column name">
		<cfreturn arguments.name>
	</cffunction>

	<!--- createTable - need to create sequence --->
	<cffunction name="createTable" returntype="string" access="public" hint="generates sql to create a table">
		<cfargument name="name" type="string" required="true" hint="table name">
		<cfargument name="columns" type="array" required="true" hint="array of column definitions">
		<cfargument name="foreignKeys" type="array" required="false" default="#ArrayNew(1)#" hint="array of foreign key definitions">
		<cfscript>
		$execute("CREATE SEQUENCE #quoteTableName(arguments.name & "_seq")# START WITH 1 INCREMENT BY 1");
		announce("Created sequence #arguments.name#_seq");
		</cfscript>
		<cfreturn Super.createTable(argumentCollection=arguments)>
	</cffunction>
	
	<!--- need to rename sequence --->
	<cffunction name="renameTable" returntype="string" access="public" hint="generates sql to rename a table">
		<cfargument name="oldName" type="string" required="true" hint="old table name">
		<cfargument name="newName" type="string" required="true" hint="new table name">
		<cfscript>
		$execute("RENAME #quoteTableName(arguments.oldName & "_seq")# TO #quoteTableName(arguments.newName & "_seq")#");
		announce("Renamed sequence #arguments.oldName#_seq to #arguments.newName#_seq");
		</cfscript>
		<cfreturn Super.renameTable(argumentCollection=arguments)>
	</cffunction>

	<!--- dropTable - need to drop sequence --->
	<cffunction name="dropTable" returntype="string" access="public" hint="generates sql to drop a table">
		<cfargument name="name" type="string" required="true" hint="table name">
		<cfscript>
		$execute("DROP SEQUENCE #quoteTableName(arguments.name & "_seq")#");
		announce("Dropped sequence #arguments.name#_seq");
		</cfscript>
		<!--- DROP TABLE IF EXISTS IS MORE COMPLEX FOR ORACLE --->
		<cfreturn "DROP TABLE #quoteTableName(LCase(arguments.name))# PURGE">
	</cffunction>
	
	<cffunction name="addColumnToTable" returntype="string" access="public" hint="generates sql to add a new column to a table">
		<cfargument name="name" type="string" required="true" hint="table name">
		<cfargument name="column" type="any" required="true" hint="column definition object">
		<cfreturn "ALTER TABLE #quoteTableName(LCase(arguments.name))# ADD #arguments.column.toSQL()#">
	</cffunction>
	
	<cffunction name="changeColumnInTable" returntype="string" access="public" hint="generates sql to change an existing column in a table">
		<cfargument name="name" type="string" required="true" hint="table name">
		<cfargument name="column" type="any" required="true" hint="column definition object">
		<cfreturn "ALTER TABLE #quoteTableName(LCase(arguments.name))# MODIFY #arguments.column.toSQL()#">
	</cffunction>
	
	<!--- renameColumnInTable - use default --->
	
	<!--- dropColumnFromTable - use default --->
	
	<!--- addForeignKeyToTable - use default --->
	
	<cffunction name="dropForeignKeyFromTable" returntype="string" access="public" hint="generates sql to add a foreign key constraint to a table">
		<cfargument name="name" type="string" required="true" hint="table name">
		<cfargument name="keyName" type="any" required="true" hint="foreign key name">
		<cfreturn "ALTER TABLE #quoteTableName(LCase(arguments.name))# DROP CONSTRAINT #quoteTableName(arguments.keyname)#">
	</cffunction>
	
	<!--- foreignKeySQL - use default --->
	
	<!--- addIndex - use default --->
	
	<!--- removeIndex - use default --->
	

</cfcomponent>