<cfif thisTag.executionMode is "start">
  <cfparam name="attributes.seperator" default=">>">
  <cfparam name="attributes.noLinks" default="false">  
  
  <cfset crumbs = []>
  <cfset links = []>
  <cfset i = 2>
  <cfset breadCrumbs = "">  
    
  <cfset thisPage = request.page>
  <cfset crumbs[1] = thisPage.title>
  <cfset links[1] = thisPage.slug>
    
  <cfset currentCrumb = thisPage.parentid>

  <cfloop condition="currentCrumb is NOT 0">
    <cfquery name="parent" datasource="#application.wheels.dataSourceName#" maxrows="1">
      select * from pages
      where ID = #currentCrumb#
    </cfquery>
    
    <cfif parent.recordCount gt 0>
      <cfset crumbs[i] = parent.title>
      <cfset links[i] = parent.slug>
      <cfset currentCrumb = parent.parentID>
    <cfelse>
      <cfset currentCrumb = 0>
    </cfif>
    <cfset i = i + 1>
  </cfloop>
  
  <!--- <cfset crumbs = reverse(crumbs)>
  <cfset links = reverse(links)> --->

  <cfloop from="1" to="#arrayLen(crumbs)#" index="i">
    <c>
    <cfset breadCrumbs = attributes.seperator & '<a href="#links[i]#">#crumbs[i]#</a>' & breadCrumbs>
  </cfloop>
  <cfoutput>#breadcrumbs#</cfoutput>
</cfif>