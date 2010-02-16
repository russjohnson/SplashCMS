<cfcomponent extends="plugins.dbmigrate.Migration" hint="creates users table">
  <cffunction name="up">
    <cfscript>
    t = createTable('users');
    t.string(columnNames="username", limit="20");
    t.string(columnNames="password", limit="255");
    t.string(columnNames="email", limit="100");
    t.string(columnNames="name", limit="100");
    t.boolean(columnNames="admin,developer", default="0");
    t.datetime(columnNames="lastLogin");
    t.integer(columnNames="createdByID,updatedByID");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  
  <cffunction name="down">
    <cfscript>
    dropTable('users');
    </cfscript>
  </cffunction>
</cfcomponent>