<cfif thisTag.executionMode IS "start">
    <cfparam name="attributes.name" default="">
  
    <cfquery name="snippet" datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#" maxrows="1">
        SELECT * FROM snippets
        WHERE name = '#attributes.name#'
    </cfquery>
  
  <!--- <cfset snippet = caller.model('snippet').fineOneByName(attributes.name)> --->

      <cfif snippet.recordCount GT 0>
          <cfoutput>
              <cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#">
              </cfoutput>
      </cfif>
</cfif>