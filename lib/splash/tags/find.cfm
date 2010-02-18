<!---
Usage:
<s:find slug="slug_to_find">...</s:find>

The <s:find> tag finds the page with the specified slug and stores a reference to the page in request.tags.page.
--->

<cfif thisTag.executionMode IS "start">
  <cfparam name="attributes.slug" default="/" type="string" />

  <!--- How should errors like a missing slug be handled? --->

  <cfset found = request.page.findOneBySlug(attributes.slug)>

  <!--- Return the variable back to the user --->
  <cfif IsObject(found)>
  	<cfif NOT IsDefined("request.tags")>
    	<cfset request.tags = {}>	
    </cfif>
  	<cfset request.tags.page = found>
  <!--- What if the slug isn't found? What should be put in request.tags.page? --->
  </cfif>
</cfif>

<cfif thisTag.executionMode IS "end">
	<cfset request.tags.page = "" >
</cfif>
