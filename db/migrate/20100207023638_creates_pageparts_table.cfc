<cfcomponent extends="plugins.dbmigrate.migration" hint="creates pageparts table">
  <cffunction name="up">
    <cfscript>
    t = createTable('pageparts');
    t.integer(columnNames="pageid");
    t.string(columnNames="name", limit="100");
    t.text(columnNames="content");
    t.string(columnNames="filename", limit="39");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('pageparts');
    </cfscript>
  </cffunction>
</cfcomponent>
