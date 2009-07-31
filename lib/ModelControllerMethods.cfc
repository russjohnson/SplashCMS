<!---  ModelControllerMethods --->
<!--- @@Created By: Russ Johnson on 2009-07-22. --->
<!--- @@Copyright: Copyright (c) 2009 Mad Piranha, Inc.. All rights reserved. --->
<!--- @@Description: This file can be included into any of your Controllers to 
                     automatically add CRUD methods for that model. This should 
                     help to DRY up your controllers considerably
                     
      @@Instructions: Copy this file into the /lib directory of your Wheels application.
                      In the controller file that you want to use the generic CRUD methods
                      add this line below the init method:
                      <cfinclude template="/lib/ModelControllerMethods.cfm">
                      Make sure you have the needed views created as well:
                      index, new, edit, show
--->

<cfcomponent extends="controllers.Controller">
  <cffunction name="index">
  	<cfset "#controllerName()#" = model(modelName()).findAll()>
  </cffunction>

  <cffunction name="show">
    <cfset "#modelName()#" = model(modelName()).findByKey(params.key)>
	
    <cfif NOT IsObject(evaluate(modelName()))>
      <cfset flashInsert(info="No #modelName()# exists for ID #params.key#")>
  
      <cftry>
      	<cfset redirectTo(back=true)>
  	
      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(action="index")>
      	</cfcatch>
      </cftry>
    </cfif>
  </cffunction>

  <cffunction name="new">
  	<cfset "#modelName()#" = model(modelName()).new()>
  </cffunction>

  <cffunction name="edit">
  	<cfset "#modelName()#" = model(modelName()).findByKey(params.key)>
	
    <cfif NOT IsObject(evaluate(modelName()))>
      <cfset flashInsert(info="No #controllerName()# exists for ID #params.key#")>
   	
     	<cftry>
      	<cfset redirectTo(back=true)>
    	
      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(action="index")>
      	</cfcatch>
      </cftry>
    </cfif>
  </cffunction>

  <cffunction name="create">
  	<cfset "#modelName()#" = model(modelName()).new(params[modelName()])>

  	<!--- Verify that the record creates successfully --->
  	<cfif evaluate(modelName()).save()>
	  
  		<cfset flashInsert(success="The #modelName()# was created successfully")>
      <cfset redirectTo(action="show", key=evaluate(modelName()).id)>
  	<cfelse>
  		<cfset flashInsert(error="There was an error creating the #modelName()#.")>
  		<cfset renderPage(action="new")>
  	</cfif>
  </cffunction>

  <cffunction name="update">
  	<cfset "#modelName()#" = model(modelName()).findByKey(params.key)>
		
  	<!--- Verify that the record updates successfully --->
  	<cfif evaluate(modelName()).update(params[modelName()])>
  		<cfset flashInsert(success="The #modelName()# was updated successfully.")>	
      <cfset redirectTo(action="show", key=evaluate(modelName()).id)>
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the #modelName()#.")>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>

  <cffunction name="delete">
  	<cfset "#modelName()#" = model(modelName()).findByKey(key.id)>
	
  	<!--- Verify that the record deletes successfully --->
  	<cfif evaluate(modelName()).delete()>
  		<cfset flashInsert(success="The #modelName()# was deleted successfully.")>	
      <cfset redirectTo(action="index")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the #modelName()#.")>
  		<cfset redirectTo(action="index")>
  	</cfif>
  </cffunction>

  <!--- PRIVATE METHODS --->

  <cffunction name="controllerName" access="private">
    <cfreturn toString(params.controller)>
  </cffunction>

  <cffunction name="modelName" access="private">
    <cfreturn toString(singularize(params.controller))>
  </cffunction>
</cfcomponent>