<cfcomponent extends="Wheels" output="false">

  <cffunction name="setCreatedByID">
    <cfset this.createdById = session.currentUser.id>
  </cffunction>
  
  <cffunction name="setUpdatedByID">
    <cfset this.updatedById = session.currentUser.id>
  </cffunction>
  
</cfcomponent>