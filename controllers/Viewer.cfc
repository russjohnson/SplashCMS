<!---  Viewer --->
<!--- @@Created By: Russ Johnson on 2009-07-30. --->
<!--- @@Copyright: Copyright (c) 2009 Mad Piranha, Inc.. All rights reserved. --->
<!--- @@License: --->
<cfcomponent extends="Controller">
	
	<cffunction name="init">
	</cffunction>
	
	<cffunction name="index">
    <cfparam name="params.slug" default="/">
    <cfset page = model('page').findOneBySlug(params.slug)>
    <cfset pageBody = model('pagePart').findOneByPageidAndName('#page.id#, body')>
    <cfset pageLayout = page.pageLayout()>
    <cfset renderedPage = parseDSL(pageLayout.content)>
  </cffunction>
	
</cfcomponent>