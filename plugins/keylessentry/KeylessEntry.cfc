<cfcomponent output="false">

  <cffunction name="init">
    <cfset this.version = "0.9.3">
    <cfreturn this>
  </cffunction>
  
  <cffunction name="loginRequired">
		<cfif Not structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You do not have permissions to do that!")>
			<cfset redirectTo(controller="sessions", action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="loginProhibited">
		<cfif structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You are logged in, you cant do that!")>
			<cfset redirectTo(route="home")>
		</cfif>
	</cffunction>
	
	<cffunction name="isLoggedIn">
    <cfif structKeyExists(session, "currentUser")>
      <cfreturn true>
    <cfelse>
      <cfreturn false>
    </cfif>
  </cffunction>
  
  <cffunction name="isAdmin">
    <cfif structKeyExists(session, "currentUser") and NOT session.currentUser.isAdmin>
      <cfset flashInsert(error="You do not have permissions to do that!")>
  		<cfset redirectTo(route="home")>
    </cfif>
  </cffunction>
	
	<!---
	 TODO Might look to add a function for checking if the user is the current user
	--->
	
	<!--- 
	  GENERATION METHODS
	--->
	
	<cffunction name="generateAuthCode">
	  
	  <cfset var loc = {}>
	    
	  <!--- Check the environment for "design" or "development" --->
		<cfset $checkDevEnv()>
		  
		<!--- Setup the information for the user --->
		<cfset loc.message = "">
		  
		<!--- Create the model --->
		<cfset loc.message = loc.message & $generateModelFile('user') & "<br/>">
		<!--- Create the controllers --->
		<cfset loc.message = loc.message & $generateControllerFile('user') & "<br/>">
		<cfset loc.message = loc.message & $generateControllerFile('session') & "<br/>">
		<cfset loc.message = loc.message & $generateControllerFile('activation') & "<br/>">
		<!--- Create the view folders--->
		<cfset loc.message = loc.message & $generateViewFolders('user') & "<br/>">
		
	  <!--- Create the view files --->
	  <cfset loc.message = loc.message & $generateViewFile('index','user') & "<br/>">
	  <cfset loc.message = loc.message & $generateViewFile('new','user') & "<br/>">
	  <cfset loc.message = loc.message & $generateViewFile('edit','user') & "<br/>">
	  <cfset loc.message = loc.message & $generateViewFile('show','user') & "<br/>">
	  
	  <cfset loc.message = loc.message & $generateViewFolders('session') & "<br/>">
	  <cfset loc.message = loc.message & $generateViewFile('new','session') & "<br/>">
	 
	 <cfreturn loc.message>
	</cffunction>
	
	
	<cffunction name="$generateModelFile" access="public" returnType="string" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		  
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created --->
		<cfif $checkIfExists(arguments.name, "Model")>
		    <cfset loc.message = "File 'models/#capitalize(arguments.name)#.cfc' already exists so skipped.">
		<cfelse>
			<cfset $moveFilesToFolder(arguments.name, "Model")>
		    <cfset loc.message = "File 'models/#capitalize(arguments.name)#.cfc' created.">
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	<cffunction name="$generateViewFile" access="public" returnType="string" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the file">
		<cfargument name="modelName" type="string" required="true" hint="Name of the object">
		
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created --->
		<cfif $checkIfExists(arguments.name, "ViewFile", arguments.modelName)>
		    <cfset loc.message = "File 'views/#lCase(pluralize(arguments.modelName))#/#arguments.name#.cfm' already exists so skipped.">
		<cfelse>
			<cfset $moveFilesToFolder(arguments.name, "ViewFile", arguments.modelName)>
		    <cfset loc.message = "File 'views/#lCase(pluralize(arguments.modelName))#/#arguments.name#.cfm' created.">
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	
	<cffunction name="$generateViewFolders" access="public" returnType="string" output="false">
	  <cfargument name="name" type="string" required="true">
	    
		<cfset var loc = {}>
		
		<!--- Check that the folder to store the views has not been already created --->
		<cfif $checkIfExists(arguments.name, "View")>
		    <cfset loc.message = "Folder 'views/#capitalize(pluralize(arguments.name))#/' already exists so skipped.">  
		<cfelse>
			<cfset $moveFilesToFolder(arguments.name, "View")>
			<cfset loc.message = "Folder 'views/#capitalize(pluralize(arguments.name))#/' created.">		
		</cfif>
	  
		<cfreturn loc.message>
	</cffunction>
	
	
	<cffunction name="$generateControllerFile" access="public" returnType="string" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created --->
		<cfif $checkIfExists(arguments.name, "Controller")>
		    <cfset loc.message = "File 'controllers/#capitalize(pluralize(arguments.name))#.cfc' already exists so skipped.">
		<cfelse>
			<cfset $moveFilesToFolder(arguments.name, "Controller")>
		    <cfset loc.message = "File 'controllers/#capitalize(pluralize(arguments.name))#.cfc' created.">
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	
	<cffunction name="$checkIfExists" access="public" returntype="boolean" hint="Checks if the desired object is already created" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the file to search for">
	  <cfargument name="type" type="string" required="true" hint="Type of file to look for (Model, View, Controller)">
	  <cfargument name="modelName" type="string" required="false">
	    
	    <cfset var loc = {}>
	 	
	    <!--- Expand the target folder --->
	    <cfswitch expression="#arguments.type#">
	    	<cfcase value="Model">
	    		<cfset loc.targetFolderPath = expandPath("models/")>
	      </cfcase>
	      <cfcase value="View">
	        <!---
	         TODO may need to set something up here to check which folder we are working on, users, or sessions
	        --->
	    		<cfset loc.targetFolderPath = expandPath("views/" & LCase(pluralize(arguments.name)))>
	      </cfcase>
	      <cfcase value="ViewFile">
	        <cfset loc.targetFolderPath = expandPath("views/" & LCase(pluralize(arguments.modelName)))>
	      </cfcase>
	      <cfcase value="Controller">
	      	<cfset loc.targetFolderPath = expandPath("controllers/")>
	      </cfcase>
	    </cfswitch>
	    
	    <!--- Find the names of all the files in the targeted folder --->
	    <cfdirectory name="loc.files" action="list" directory="#loc.targetFolderPath#" type="file">
	    
	    <!--- Check if the desired file is already in the targeted folder --->
		<cfif FindNoCase(arguments.name, ValueList(loc.files.name)) GT 0 OR DirectoryExists(loc.targetFolderPath) AND arguments.type IS "View">
	    	<cfset loc.wasFound = true>
	    <cfelse>
	    	<cfset loc.wasFound = false>
		</cfif>
	    
	    <cfreturn loc.wasFound>
	</cffunction>
	
	
	<cffunction name="$moveFilesToFolder" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" hint="Name to set the file when moved">
	  <cfargument name="type" type="string" required="true" hint="Type of file to move for (Model, View, Controller)">
	  <cfargument name="modelName" type="string" required="false">
	  
	  <cfset var loc = {}>
	    
	  <!--- Expand the destination folder and read the file move over --->
	  <cfswitch expression="#arguments.type#">
	    <cfcase value="Model">
	            
  			<!--- Expand the from and destination folders depding on the typ --->
  			<cfset loc.fromFolderPath = expandPath("plugins/keylessentry/templates/models")>
  			<cfset loc.destinationFolderPath = expandPath("models")>
	    		
  	    <!--- Read the template file --->
  	    <cffile action="read" file="#loc.fromFolderPath#/User.cfm" variable="loc.file"> 
	        
        <!--- Write the file in the corresponding folder --->
        <cffile action="write" file="#loc.destinationFolderPath#/#capitalize(arguments.name)#.cfc" output="#loc.file#" mode="644"> 
      </cfcase>
	        
      <cfcase value="View">
        	
        <!--- Expand the from and destination folders --->
    		<cfset loc.fromFolderPath = expandPath("plugins/keylessentry/templates/views/" & LCase(pluralize(arguments.name)))>
        <cfset loc.destinationFolderPath = expandPath("views/" & LCase(pluralize(arguments.name)))>
            
        <!--- Create the directory to store the views in --->
        <cfif NOT DirectoryExists(loc.destinationFolderPath)>
        	<cfdirectory action="create" directory="#loc.destinationFolderPath#">
        </cfif>
      </cfcase>
      
      <cfcase value="viewFile">
        <!--- Expand the from and destination folders --->
    		<cfset loc.fromFolderPath = expandPath("plugins/keylessentry/templates/views/" & LCase(pluralize(arguments.modelName)))>
        <cfset loc.destinationFolderPath = expandPath("views/" & LCase(pluralize(arguments.modelName)))>
          
        <cffile action="read" file="#loc.fromFolderPath#/#lCase(arguments.name)#.cfm" variable="loc.file">
          
        <cffile action="write" file="#loc.destinationFolderPath#/#lCase(arguments.name)#.cfm" output="#loc.file#" mode="644"> 
      </cfcase>
	        
	        
      <cfcase value="Controller">
        
        <!--- Expand the from and destination folders --->
    		<cfset loc.fromFolderPath = expandPath("plugins/keylessentry/templates/controllers")>
        <cfset loc.destinationFolderPath = expandPath("controllers")>
          
        <!--- Read the template file --->
	      <cffile action="read" file="#loc.fromFolderPath#/#capitalize(pluralize(arguments.name))#.cfm" variable="loc.file"> 
	            
	      <!--- Write the file in the corresponding folder --->
	      <cffile action="write" file="#loc.destinationFolderPath#/#capitalize(pluralize(arguments.name))#.cfc" output="#loc.file#" mode="644"> 
            
      </cfcase>
        
      <cfdefaultcase>
      	<!--- Display a nice Wheels error? --->
      </cfdefaultcase>
    </cfswitch>
	    
	</cffunction>
	
	
	<cffunction name="$checkDevEnv" access="public" returnType="void" hint="Checks that the enviroment is either 'design' or 'development'" output="false">
	
		<!--- Only run this if the environment is not "design" or "development" --->
		<cfif get("environment") IS NOT "design" AND get("environment") IS NOT "development">
			<!--- Throw an useful Wheels error --->
			<cfset $throw(type="Wheels.Plugins.KeylessEntry.InvalidEnviroment", message="The method of this plugin that you are calling is not meant to run on production mode.", extendedInfo="If you want to use the plugin to generate your authentication code, please change your environment to 'design' or 'development'.")>
			
		</cfif>
	
	</cffunction>

</cfcomponent>