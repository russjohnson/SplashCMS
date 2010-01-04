<cfcomponent extends="Wheels" output="false">

  <cffunction name="setCreatedByID">
    <cfset this.createdById = session.currentUser.id>
  </cffunction>
  
  <cffunction name="setUpdatedByID">
    <cfset this.updatedById = session.currentUser.id>
  </cffunction>
  
  <cffunction name="write">
        <!--- change our filename to the new file --->
        <!--- delete our old file --->
        <!--- <cfif fileExists("#application.defaults.layoutsPath#/#this.fileName#")>
                    <cffile action="delete" file="#application.defaults.layoutsPath#/#this.changedFrom(property='filename')#">
                </cfif> --->
        <!--- <cfset this.fileName = CreateUUID() & ".cfm"> --->

        <!--- write the file to disk --->
        <cffile action="write" file="#application.defaults.layoutsPath#/#this.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#layout.content#" addnewline="no" fixnewline="yes" />
	</cffunction>
	
	<cffunction name="deleteOldFile">
	   <!--- delete our old file --->
        <cfif fileExists("#application.defaults.layoutsPath#/#this.changedFrom(property='filename')#")>
            <cffile action="delete" file="#application.defaults.layoutsPath#/#this.changedFrom(property='filename')#">
        </cfif>
	</cffunction>
  
</cfcomponent>