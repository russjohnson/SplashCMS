<cfif thisTag.executionMode IS "start">
  
  <cfparam name="attributes.part" default="">
  <cfparam name="page" default="#request.page#">

  <cfquery name="pagePart" datasource="#caller.get('dataSourceName')#" username="#caller.get('dataSourceUserName')#" password="#caller.get('dataSourcePassword')#" maxrows="1">
    SELECT * FROM pageparts
    WHERE pageID = #page.id#
    AND name = '#attributes.part#'
  </cfquery>

  <cfif pagePart.recordCount GT 0>
    <cftry>
      <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
      <cfcatch></cfcatch>
    </cftry>
  </cfif>
</cfif>