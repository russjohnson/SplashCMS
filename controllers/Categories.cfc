<cfcomponent extends="Controller" output="false">
	
	<!--- categories/index --->
	<cffunction name="index">
		<cfset categories = model("Category").findAll()>
	</cffunction>
	
	<!--- categories/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset category = model("Category").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(category)>
	        <cfset flashInsert(error="Category #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- categories/new --->
	<cffunction name="new">
		<cfset category = model("Category").new()>
	</cffunction>
	
	<!--- categories/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset category = model("Category").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(category)>
	        <cfset flashInsert(error="Category #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- categories/create --->
	<cffunction name="create">
		<cfset category = model("Category").new()>
		<cfset category.name = params.name>
		<cfset category.save()>
        <cfset option = '<option value="#category.id#">' & category.name & '</option>'>
		<cfset renderText(option)>
	</cffunction>
	
	<!--- categories/update --->
	<cffunction name="update">
		<cfset category = model("Category").findByKey(params.key)>
		
		<!--- Verify that the category updates successfully --->
		<cfif category.update(params.category)>
			<cfset flashInsert(success="The category was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the category.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- categories/delete/key --->
	<cffunction name="delete">
		<cfset category = model("Category").findByKey(params.key)>
		
		<!--- Verify that the category deletes successfully --->
		<cfif category.delete()>
			<cfset flashInsert(success="The category was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the category.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
