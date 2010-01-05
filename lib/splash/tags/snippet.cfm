<cfif thisTag.executionMode IS "start">
    <cfparam name="attributes.name" default="">
    
    <cfset wheelsProxy=CreateObject("component","controllers.Controller") >
 
    <cfset snippet = wheelsProxy.wheelsExecute("model('snippet').findOneByName('#attributes.name#')")>

      <cfif isObject(snippet)>
          <cfoutput>
                <cfif fileExists(expandPath("#application.defaults.rootPath#public/snippets/#snippet.filename#"))>
                  <cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#">
                <cfelse>
                    <cfset snippet.write()>
                    <cfif fileExists(expandPath("#application.defaults.rootPath#public/snippets/#snippet.filename#"))>
                        <cfinclude template="#application.defaults.rootPath#public/snippets/#snippet.filename#">
                    </cfif>
                </cfif>
          </cfoutput>
      </cfif>
</cfif>