<cfcomponent extends="[extends]" hint="[description]">
  <cffunction name="up">
    <cfscript>
    t = createTable('[tableName]');
   
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('[tableName]');
    </cfscript>
  </cffunction>
</cfcomponent>