<cfcomponent extends="plugins.dbmigrate.migration" hint="creates snippets table">
  <cffunction name="up">
    <cfscript>
    t = createTable('snippets');
    t.string(columnNames="name", limit="100");
    t.string(columnNames="filename", limit="39");
    t.text(columnNames="content");
    t.integer(columnNames="createdByID,updatedByID");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('snippets');
    </cfscript>
  </cffunction>
</cfcomponent>
