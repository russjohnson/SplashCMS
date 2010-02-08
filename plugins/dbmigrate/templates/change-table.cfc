<cfcomponent extends="[extends]" hint="[description]">
  <cffunction name="up">
    <cfscript>
    t = changeTable('[tableName]');
    
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='[tableName]',columnName='[columnName]');
    </cfscript>
  </cffunction>
</cfcomponent>