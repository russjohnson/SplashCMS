<cfcomponent extends="lib.ModelControllerMethods">
  
  <cffunction name="init">
    <cfset filters(through="loginRequired")>
  </cffunction>
  
  <cffunction name="create">
    <cfset layout = model('layout').new(params.layout)>

    <cfif layout.save()>
      <cfset flashInsert(success="The layout was created successfully")>
      <cfset redirectTo(route="layouts_path")>
    <cfelse>
      <cfset flashInsert(error="There was an error creating the layout.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>
  
  <cffunction name="update">
  	<cfset layout = model('layout').findByKey(params.key)>
		
  	<cfif layout.update(params.layout)>
  		<cfset flashInsert(success="The layout was updated successfully.")>	
      <cfset redirectTo(route="layouts_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the layout.")>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>
  
  <cffunction name="delete">
  	<cfset layout = model('layout').findByKey(params.id)>
	
  	<cfif layout.delete()>
  		<cfset flashInsert(success="The layout was deleted successfully. Make sure that none of your pages are using it.")>	
      <cfset redirectTo(route="layouts_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the layout.")>
  		<cfset redirectTo(route="layouts_path")>
  	</cfif>
  </cffunction>
	
</cfcomponent>
