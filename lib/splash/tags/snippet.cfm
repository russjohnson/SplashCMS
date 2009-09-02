<cfif thisTag.executionMode is "start">
  <cfparam name="attributes.name" default="">
  
  <cfquery name="snippet" datasource="#caller.get('dataSourceName')#" maxrows="1">
    select * from snippets
    where name = '#attributes.name#'
  </cfquery>
  
  <!--- <cfset snippet = caller.model('snippet').fineOneByName(attributes.name)> --->

  <cfif snippet.recordCount gt 0>
    <cfoutput>
      <cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#">
    </cfoutput>
  </cfif>
</cfif>