<cfcomponent extends="Model" output="false">

    <cffunction name="init">        
        <cfset validatesPresenceOf(property="name" , message="Your snippet must have a name.")>
        <cfset validatesPresenceOf(property="content" , message="Your snippet must have a body.")>
        <cfset validatesLengthOf(property="name", maximum="100", message="The name of your snippet is over 100 characters.", allowBlank="true")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID,deleteOldFile')>
        <cfset afterCreate('write')>
	    <cfset afterUpdate('write')>
    </cffunction>

    <cffunction name="write">
        <!--- write the file to disk --->
        <cffile action="write" file="#application.defaults.snippetsPath#/#this.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#this.content#" addnewline="no" fixnewline="yes" />
	</cffunction>
	
	<cffunction name="deleteOldFile">
	   <!--- delete our old file --->
        <cfif fileExists("#application.defaults.snippetsPath#/#this.changedFrom(property='filename')#")>
            <cffile action="delete" file="#application.defaults.snippetsPath#/#this.changedFrom(property='filename')#">
        </cfif>
	</cffunction>
	
	<cffunction name="rebuild">
	    <cfset this.update()>
	    <cfset this.write()>
	</cffunction>
</cfcomponent>
