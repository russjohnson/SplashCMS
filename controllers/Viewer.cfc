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
    
    <cfif isObject(page) AND page.status is "published">
      <cfset layoutFile = page.pageLayout().fileName>
        
      <cfsavecontent variable="renderedPage">
        <!--- include the layout --->
        <cfinclude template="#application.defaults.rootPath#public/layouts/#layoutFile#">
      </cfsavecontent>
      <!--- <cfset renderedPage = page.process(page.slug)> --->
    <cfelse>
      <!---
        TODO this should redirect to an admin themed 404 page unless a "page not found" type of page exists
      --->
      <cfset page = model('page').findOneByPageClassID('2')>
      <cfif isObject(page) AND page.status is "published">
        <cfset renderedPage = page.process(page.slug)>
      <cfelse>
        <cfset flashInsert(warning="The page you were trying to access doesnt exist.")>
        <cfset redirectTo(route="home")>
      </cfif>
    </cfif>
  </cffunction>
	
</cfcomponent>