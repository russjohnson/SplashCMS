<!---
	This is the parent model file that all your models should extend.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">

  <cffunction name="setCreatedByID">
    <cfset this.createdById = session.currentUser.id>
  </cffunction>
  
  <cffunction name="setUpdatedByID">
    <cfset this.updatedById = session.currentUser.id>
  </cffunction>
  
</cfcomponent>