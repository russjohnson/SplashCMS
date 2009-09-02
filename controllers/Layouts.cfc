<cfcomponent extends="Controller">
  
  <cffunction name="init">
    <cfset filters(through="loginRequired")>
  </cffunction>
  
  <cffunction name="index">
    <cfset layouts = model('layout').findAll() />
  </cffunction>
  
  <cffunction name="new">
    <cfset layout = model('layout').new()>
  </cffunction>
  
  <cffunction name="edit">
  	<cfset layout = model('layout').findByKey(params.key)>
	
    <cfif NOT IsObject(layout)>
      <cfset flashInsert(info="No layout exists for ID #params.key#")>
   	
     	<cftry>
      	<cfset redirectTo(back=true)>
    	
      	<cfcatch type="Wheels.RedirectBackError">
      		<cfset redirectTo(route="layouts_path")>
      	</cfcatch>
      </cftry>
    </cfif>
  </cffunction>
  
  <cffunction name="create">
    <cfset layout = model('layout').new(params.layout)>
      
    <!--- create our layouts filename --->
    <cfset layout.fileName = dateTimeFormat(now()) & ".cfm">

    <cfif layout.save()>
      <!--- write the file to disk --->
		  <cffile action="write" file="#application.defaults.layoutsPath#/#layout.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='splash' />#layout.content#" addnewline="no" fixnewline="yes" />
		  
      <cfset flashInsert(success="The layout was created successfully")>
      <cfset redirectTo(route="layouts_path")>
    <cfelse>
      <cfset flashInsert(error="There was an error creating the layout.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>
  
  <cffunction name="update">
  	<cfset layout = model('layout').findByKey(params.key)>
  	  
	  <!--- delete our old file --->
	  <cfif fileExists("#application.defaults.layoutsPath#/#layout.fileName#")>
  	  <cffile action="delete" file="#application.defaults.layoutsPath#/#layout.fileName#">
  	</cfif>
    <!--- change our filename to the new file --->
		<cfset layout.fileName = dateTimeFormat(now()) & ".cfm">
		
  	<cfif layout.update(params.layout)>
  	  <!--- write the file to disk --->
		  <cffile action="write" file="#application.defaults.layoutsPath#/#layout.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='splash' />#layout.content#" addnewline="no" fixnewline="yes" />
  	  
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
