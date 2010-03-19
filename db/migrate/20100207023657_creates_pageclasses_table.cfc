<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates pageclasses table">
  <cffunction name="up">
    <cfscript>
    t = createTable('pageclasses');
    t.string(columnNames="name", limit="35");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('pageclasses');
    </cfscript>
  </cffunction>
</cfcomponent>
