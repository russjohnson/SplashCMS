<!---
	This is the parent controller file that all your controllers should extend.
	Do not delete this file.
--->
<cfcomponent extends="wheels.Controller">
  
  <cffunction name="parseDSL">
    <cfargument name="code" type="string" required="true" />
    <cfset var loc = arguments.code>
    
    <cfif findNoCase("<c:title />", loc)>
      <cfset loc = replaceNoCase(loc, '<c:title />', page.title)>
    </cfif>
    <cfif findNoCase("<c:content />", loc)>
      <cfset loc = replaceNoCase(loc, '<c:content />', pageBody.content)>
    </cfif>
    <cfreturn loc>
  </cffunction>

<cffunction name="parseTitle">
  
</cffunction>
  
</cfcomponent>
