<cfcomponent extends="plugins.dbmigrate.migration" hint="creates pages table">
  <cffunction name="up">
    <cfscript>
    t = createTable('pages');
    t.string(columnNames="title", limit="255");
    t.string(columnNames="slug", limit="100");
    t.string(columnNames="breadcrumb", limit="160");
    t.integer(columnNames="pageclassid");
    t.string(columnNames="status", limit="25");
    t.integer(columnNames="parentid,layoutid");
    t.string(columnNames="description,keywords", limit="255");
    t.datetime(columnNames="publishedAt");
    t.integer(columnNames="createdByID,updatedByID");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('pages');
    </cfscript>
  </cffunction>
</cfcomponent>
