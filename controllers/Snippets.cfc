<cfcomponent extends="lib.ModelControllerMethods">
  
  <cffunction name="init">
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
  
  <cffunction name="delete">
  	<cfset snippet = model('snippet').findByKey(params.id)>
	
  	<cfif snippet.delete()>
  		<cfset flashInsert(success="The snippet was deleted successfully. Make sure that none of your pages or layouts are using it.")>	
      <cfset redirectTo(route="snippets_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the snippet.")>
  		<cfset redirectTo(route="snippets_path")>
  	</cfif>
  </cffunction>
	
</cfcomponent>