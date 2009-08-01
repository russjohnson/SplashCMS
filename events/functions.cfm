<!--- Place functions here that should be globally available in your application. ---> 

<cffunction name="parseDSL">
  <cfargument name="code" type="string" required="true" />
  <cfset var loc = arguments.code>
  
  <cfif findNoCase("<s:title />", loc)>
    <cfset loc = replaceNoCase(loc, '<s:title />', page.title, "ALL")>
  </cfif>
  <cfif findNoCase("<s:content />", loc)>
    <cfset loc = replaceNoCase(loc, '<s:content />', pageBody.content)>
  </cfif>
  <cfset loc = fixScriptTags(loc)>
  <cfreturn loc>
</cffunction>

<cffunction name="fixScriptTags">
  <cfargument name="code" type="string" required="true">
  <cfset var loc = arguments.code>
  
  <cfreturn replaceNoCase(loc, 'invalidtag', 'script', 'ALL')>
</cffunction>