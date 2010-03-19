<!---  PagePart --->
<!--- @@Created By: Russ Johnson on 2009-07-30. --->
<!--- @@Copyright: Copyright (c) 2009 Mad Piranha, Inc.. All rights reserved. --->
<!--- @@License: --->
<cfcomponent output="false" extends="Model">
	
	<cffunction name="init">
		<cfset belongsTo('page')>
	    <cfset beforeUpdate('deleteOldFile')>
        <cfset afterCreate('write')>
	    <cfset afterUpdate('write')>
	</cffunction>
	
	<cffunction name="write">
        <!--- write the file to disk --->
        <cffile action="write" file="#application.defaults.pagesPath#/#this.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#this.content#" addnewline="no" fixnewline="yes" charset="utf-16" />
	</cffunction>
	
	<cffunction name="deleteOldFile">
	   <!--- delete our old file --->
        <cfif fileExists("#application.defaults.pagesPath#/#this.changedFrom(property='filename')#")>
            <cffile action="delete" file="#application.defaults.pagesPath#/#this.changedFrom(property='filename')#">
        </cfif>
	</cffunction>
	
	<cffunction name="findByPage">
	    <cfargument name="pageID" type="any" required="true">
	    <cfargument name="part" type="any" required="true">
	   <cfreturn this.findOne(where="pageID = #arguments.pageID# AND name = '#arguments.part#'")>
	</cffunction>
	
</cfcomponent>