<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates snippet categories table">
  <cffunction name="up">
    <cfscript>
    t = createTable('categories');
    t.string(columnNames="name", limit="50");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('categories');
    </cfscript>
  </cffunction>
</cfcomponent>
