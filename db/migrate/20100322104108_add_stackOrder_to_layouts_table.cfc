<cfcomponent extends="plugins.dbmigrate.Migration" hint="add stackOrder to layouts table">
  <cffunction name="up">
    <cfscript>
    t = changeTable('layouts');
    addColumn(table='layouts', columnName='stackOrder', columnType="integer", default="1");
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='layouts',columnName='stackOrder');
    </cfscript>
  </cffunction>
</cfcomponent>
