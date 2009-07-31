<!---  Viewer --->
<!--- @@Created By: Russ Johnson on 2009-07-30. --->
<!--- @@Copyright: Copyright (c) 2009 Mad Piranha, Inc.. All rights reserved. --->
<!--- @@License: --->
<cfcomponent extends="Controller">
	
	<cffunction name="init">
		
	</cffunction>
	
	<cffunction name="index">
	  <!---
	   TODO this method needs to parse the layout and page to process the DSL and include relevant files, etc.
	  --->
    <cfparam name="params.slug" default="home">
    <cfset page = model('page').findOneBySlug(params.slug)>
  </cffunction>
	
</cfcomponent>