<cfcomponent extends="Base">
	
	<cffunction name="init" returntype="TableDefinition" access="public">
		<cfargument name="adapter" type="any" required="yes" hint="database adapter">
		<cfargument name="name" type="string" required="yes" hint="table name in pluralized form">
		<cfargument name="force" type="boolean" required="no" default="true" hint="whether or not to drop table of same name before creating new one">
		<cfargument name="id" type="boolean" required="no" default="false" hint="if false, defines a table with no primary key">
		<cfargument name="primaryKey" type="string" required="no" default="id" hint="overrides default primary key">
		<cfscript>
		var loc = {};
		loc.args = "adapter,name,force";
		loc.iEnd = ListLen(loc.args);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			loc.argumentName = ListGetAt(loc.args,loc.i);
			if(StructKeyExists(arguments,loc.argumentName)) {
				this[loc.argumentName] = arguments[loc.argumentName];
			}
		}
		this.columns = ArrayNew(1);
		if(arguments.id && Len(arguments.primaryKey)) {
			column(columnName=arguments.primaryKey,columnType="primaryKey");
		}
		this.foreignKeys = ArrayNew(1);
		</cfscript>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="column" returntype="void" access="public" hint="adds a column to table definition">
		<cfargument name="columnName" type="string" required="yes" hint="column name">
		<cfargument name="columnType" type="string" required="yes" hint="column type">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfargument name="limit" type="numeric" required="no" hint="character or integer size">
		<cfargument name="precision" type="numeric" required="no" hint="number of digits the column can hold">
		<cfargument name="scale" type="numeric" required="no" hint="number of digits that can be placed to the right of the decimal point (must be less than or equal to precision)">
		<cfscript>
		var loc = {};
		arguments.adapter = this.adapter;
		arguments.name = arguments.columnName;
		arguments.type = arguments.columnType;
		loc.column = CreateObject("component","ColumnDefinition").init(argumentCollection=arguments);
		ArrayAppend(this.columns,loc.column);
		</cfscript>
	</cffunction>
	
	<cffunction name="binary" returntype="void" access="public" hint="adds binary columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "binary";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>

	<cffunction name="boolean" returntype="void" access="public" hint="adds boolean columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "boolean";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>

	<cffunction name="date" returntype="void" access="public" hint="adds date columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "date";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>

	<cffunction name="datetime" returntype="void" access="public" hint="adds datetime columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "datetime";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="decimal" returntype="void" access="public" hint="adds decimal columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfargument name="precision" type="numeric" required="no" hint="number of digits the column can hold">
		<cfargument name="scale" type="numeric" required="no" hint="number of digits that can be placed to the right of the decimal point (must be less than or equal to precision)">
		<cfscript>
		var loc = {};
		arguments.columnType = "decimal";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="float" returntype="void" access="public" hint="adds float columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" default="" hint="default value">
		<cfargument name="null" type="boolean" required="no" default="true" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "float";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>

	<cffunction name="integer" returntype="void" access="public" hint="adds integer columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="limit" type="numeric" required="no" hint="integer size">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "integer";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="string" returntype="void" access="public" hint="adds string columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="limit" type="numeric" required="no" hint="character limit">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "string";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="text" returntype="void" access="public" hint="adds text columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "text";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="time" returntype="void" access="public" hint="adds time columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "time";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>	
	
	<cffunction name="timestamp" returntype="void" access="public" hint="adds timestamp columns to table definition">
		<cfargument name="columnNames" type="string" required="yes" hint="one or more column names, comma delimited">
		<cfargument name="default" type="string" required="no" hint="default value">
		<cfargument name="null" type="boolean" required="no" hint="whether nulls are allowed">
		<cfscript>
		var loc = {};
		arguments.columnType = "timestamp";
		loc.iEnd = ListLen(arguments.columnNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			arguments.columnName = ListGetAt(arguments.columnNames,loc.i);
			column(argumentCollection=arguments);
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="timestamps" returntype="void" access="public" hint="adds CFWheels convention automatic timestamp and soft delete columns to table definition">
		<cfscript>
		timestamp(columnNames="createdat,updatedat,deletedat",null=true);
		</cfscript>
	</cffunction>
    
	<cffunction name="references" returntype="void" access="public" hint="adds integer reference columns to table definition and creates foreign key constraints">
		<cfargument name="referenceNames" type="string" required="yes" hint="one or more reference names (singular of referenced tables), comma delimited. eg. referenceNames=page will create a column pageId that references table:pages, column:id">
		<cfargument name="default" type="string" required="no" default="NULL" hint="default value">
		<cfargument name="null" type="boolean" required="no" default="true" hint="whether nulls are allowed">
		<cfargument name="polymorphic" type="boolean" required="no" default="false" hint="whether or not to create an Id/Type pair of columns for a polymorphic relationship">
		<cfargument name="foreignKey" type="boolean" required="no" default="true" hint="whether or not to create a foreign key constraint">
		<cfscript>
		var loc = {};
		loc.iEnd = ListLen(arguments.referenceNames);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			loc.referenceName = ListGetAt(arguments.referenceNames,loc.i);
			column(columnName = loc.referenceName & "id",columnType="integer",default=arguments.default,null=arguments.null);
			if(arguments.polymorphic) {
				column(columnName=loc.referenceName & "type",columnType="string");
			}
			if(arguments.foreignKey && !arguments.polymorphic) {
				loc.referenceTable = pluralize(loc.referenceName);
				loc.foreignKey = CreateObject("component","ForeignKeyDefinition").init(adapter=this.adapter,table=this.name,referenceTable=loc.referenceTable,column="#loc.referenceName#id",referenceColumn="id");
				ArrayAppend(this.foreignKeys,loc.foreignKey);
			}
		}
		</cfscript>
	</cffunction>

	<cffunction name="create" returntype="void" access="public" hint="creates the table in the database">
		<cfscript>
		if(this.force) {
			$execute(this.adapter.dropTable(this.name));
			announce("Dropped table #LCase(this.name)#");
		}
		$execute(this.adapter.createTable(name=this.name,columns=this.columns,foreignKeys=this.foreignKeys));
		announce("Created table #LCase(this.name)#");
		loc.iEnd = ArrayLen(this.foreignKeys);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			announce("--> added foreign key #this.foreignKeys[loc.i].name#");
		}
		</cfscript>
	</cffunction>

	<cffunction name="change" returntype="void" access="public" hint="alters existing table in the database">
		<cfargument name="addColumns" type="boolean" required="false" default="false" hint="if true, attempt to add new columns, else check whether column exists to determine whether to add or update">
		<cfscript>
		var loc = {};
		loc.existingColumns = $getColumns(this.name);
		loc.iEnd = ArrayLen(this.columns);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			if(arguments.addColumns || !ListFindNoCase(loc.existingColumns,this.columns[loc.i].name)) {
				$execute(this.adapter.addColumnToTable(name=this.name,column=this.columns[loc.i]));
				announce("Added column #this.columns[loc.i].name# to table #this.name#");
			} else {
				$execute(this.adapter.changeColumnInTable(name=this.name,column=this.columns[loc.i]));
				announce("Changed column #this.columns[loc.i].name# in table #this.name#");
			}
		}
		loc.iEnd = ArrayLen(this.foreignKeys);
		for (loc.i=1; loc.i <= loc.iEnd; loc.i++) {
			$execute(this.adapter.addForeignKeyToTable(name=this.name,foreignKey=this.foreignKeys[loc.i]));
			announce("Added foreign key #this.foreignKeys[loc.i].name# to table #this.name#");			
		}
		</cfscript>
	</cffunction>

</cfcomponent>