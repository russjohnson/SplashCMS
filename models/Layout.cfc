<cfcomponent extends="Model" output="false">

	<cffunction name="init">
        <cfset hasMany("pages")>

        <cfset validatesPresenceOf(property="name" , message="Your layout must have a name.")>
        <cfset validatesLengthOf(property="name", maximum="100", message="Your layout name exceeds 100 characters.", allowBlank="true")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID,deleteOldFile')>
	    <cfset afterCreate('write')>
	    <cfset afterUpdate('write')>
	</cffunction>
	
	<cffunction name="write">
        <!--- write the file to disk --->
        <cffile action="write" file="#application.defaults.layoutsPath#/#this.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#this.content#" addnewline="no" fixnewline="yes" charset="utf-16" />
	</cffunction>
	
	<cffunction name="deleteOldFile">
	   <!--- delete our old file --->
        <cfif fileExists("#application.defaults.layoutsPath#/#this.changedFrom(property='filename')#")>
            <cffile action="delete" file="#application.defaults.layoutsPath#/#this.changedFrom(property='filename')#">
        </cfif>
	</cffunction>
	
	<cffunction name="reorder">
		<cfargument name="order" type="string" required="yes" />
		
		<cfset var loc = {}>
		
		<!--- For every item passed, update it's position --->
		<cfloop from="1" to="#ListLen(arguments.order)#" index="loc.position">	
			<cfset this.updateByKey(key=ListLast(ListGetAt(arguments.order, loc.position), '_'), stackOrder=loc.position) />
		</cfloop>
	</cffunction>
</cfcomponent>
