<cfcomponent extends="Controller" output="false">
	
	<!--- [NamePluralLowercaseDeHumanized]/index --->
	<cffunction name="index">
		<cfset [NamePluralLowercase] = model("[NameSingularUppercase]").findAll()>
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject([NameSingularLowercase])>
	        <cfset flashInsert(error="[NameSingularUppercase] #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/new --->
	<cffunction name="new">
		<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").new()>
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject([NameSingularLowercase])>
	        <cfset flashInsert(error="[NameSingularUppercase] #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/create --->
	<cffunction name="create">
		<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").new(params.[NameSingularLowercase])>
		
		<!--- Verify that the [NameSingularLowercase] creates successfully --->
		<cfif [NameSingularLowercase].save()>
			<cfset flashInsert(success="The [NameSingularLowercase] was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the [NameSingularLowercase].")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/update --->
	<cffunction name="update">
		<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key)>
		
		<!--- Verify that the [NameSingularLowercase] updates successfully --->
		<cfif [NameSingularLowercase].update(params.[NameSingularLowercase])>
			<cfset flashInsert(success="The [NameSingularLowercase] was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the [NameSingularLowercase].")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- [NamePluralLowercaseDeHumanized]/delete/key --->
	<cffunction name="delete">
		<cfset [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key)>
		
		<!--- Verify that the [NameSingularLowercase] deletes successfully --->
		<cfif [NameSingularLowercase].delete()>
			<cfset flashInsert(success="The [NameSingularLowercase] was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the [NameSingularLowercase].")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>