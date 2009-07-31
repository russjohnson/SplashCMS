<cfcomponent extends="lib.ModelControllerMethods">
  
  <cffunction name="init">
    <cfset layout("/layout_login")>
    <cfset filters(through="loginRequired")>
  </cffunction>
  
  <cffunction name="create">
    <cfset snippet = model('snippet').new(params.snippet)>
    
    <cfif snippet.save()>
      <cfset flashInsert(success="The snippet was created successfully")>
      <cfset redirectTo(route="snippets_path")>
    <cfelse>
      <cfset flashInsert(error="There was an error creating the snippet.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>
  
  <cffunction name="update">
  	<cfset snippet = model('snippet').findByKey(params.key)>
		  
  	<cfif snippet.update(params.snippet)>
  		<cfset flashInsert(success="The snippet was updated successfully.")>	
      <cfset redirectTo(route="snippets_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the snippet.")>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>
	
</cfcomponent>