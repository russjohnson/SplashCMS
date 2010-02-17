<cfcomponent extends="plugins.dbmigrate.migration" hint="add categoryid to snippets table">
  <cffunction name="up">
    <cfscript>
    t = changeTable('snippets');
    addColumn(table='snippets', columnName='categoryid', columnType="integer");
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='snippets',columnName='categoryid');
    </cfscript>
  </cffunction>
</cfcomponent>
