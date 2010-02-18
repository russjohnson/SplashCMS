<cfsetting showDebugOutput="No">
<cfinclude template="/events/functions.cfm">

<cfif thisTag.executionMode IS "start">
	<cfset loc = {}>
	<!--- Find all the pages, then sort them in "tree" order --->
	<cfset qSitemap = request.page.model('page').findAll(WHERE="status = 'Published' AND PageClassID = 1") >
    <cfset qSitemap = queryTreeSort(qSitemap)>
    
	<cfset loc.baseURL = "http://" & HTTP_HOST>
	<cfif application.wheels.URLRewriting EQ "Partial">
    	<cfset loc.partialHref = "/index.cfm">
    <cfelse>
    	<cfset loc.partialHref = "">
    </cfif>
    <cfset loc.siteURL = loc.baseURL & loc.partialHref>
    
<cfcontent type="text/xml" reset="Yes"><?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<cfoutput query="qSitemap">  <url>
    <loc><cfif slug EQ "/">#loc.baseURL#<cfelse>#loc.siteURL & "/" & slug#</cfif></loc>
    <lastmod>#DateFormat(PublishedAt, "YYYY-MM-DD")#</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>    
</cfoutput></urlset> 

<cfabort> 
</cfif>
