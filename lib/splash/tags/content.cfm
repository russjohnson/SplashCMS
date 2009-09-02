<cfif thisTag.executionMode is "start">
  
  <cfparam name="attributes.part" default="">
  <cfparam name="page" default="#caller.page#">

  <cfquery name="pagePart" datasource="#caller.get('dataSourceName')#" maxrows="1">
    select * from pageParts
    where pageID = #page.id#
    and name = '#attributes.part#'
  </cfquery>

  <cfif pagePart.recordCount gt 0>
    <cftry>
      <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
      <cfcatch></cfcatch>
    </cftry>
  </cfif>
</cfif>