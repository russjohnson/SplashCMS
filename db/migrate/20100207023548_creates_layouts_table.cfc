<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates layouts table">
  <cffunction name="up">
    <cfscript>
    t = createTable('layouts');
    t.string(columnNames="name", limit="100");
    t.text(columnNames="content");
    t.string(columnNames="filename", limit="39");
    t.integer(columnNames="createdByID,updatedByID");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('layouts');
    </cfscript>
  </cffunction>
</cfcomponent>
