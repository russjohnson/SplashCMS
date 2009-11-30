<cfcomponent extends="Controller" output="false">
  
  <cffunction name="init">
    <cfset filters(through="loginRequired")>
  </cffunction>
  
  <cffunction name="index">
    <cfset pages = model('pages').findAll()>
    <cfset pages = queryTreeSort(pages)>
  </cffunction>
  
  <cffunction name="pageList">
    <cfset renderNothing()>
  </cffunction>
  
  <cffunction name="new">
    <cfset page = model('page').new()>
    <cfset page.parentid = params.parentid>
    <cfset layouts = model('layout').findAll()>
    <cfset pageClasses = model('pageClass').findAll()>
    <cfset status = ['Draft', 'Reviewed', 'Published', 'Hidden']>
    <cfset pagePart = model('pagePart').new()>
    <cfset pagePart.name = application.defaults.page.parts>
  </cffunction>
  
  <cffunction name="create">
    <cfset layouts = model('layout').findAll()>
    <cfset pageClasses = model('pageClass').findAll()>
    <cfset page.parentid = params.parentid>
    <cfset status = ['Draft', 'Reviewed', 'Published', 'Hidden']>
    <cfset page = model('page').new(params.page)>
    
    <cfif page.save()>
      
      <!--- need to loop through the pageParts that get passed in params and save them --->
      <cfloop collection="#params.pagePart#" item="item">
        <cfset pagePart = page.newPagePart()>
        <cfset pagePart.name = item>
        <cfset pagePart.content = evaluate("params.pagePart_#item#").content>
        <cfset pagePart.fileName = dateTimeFormat(now()) & ".cfm">
        <cfset pagePart.save()>
        <cffile action="write" file="#application.defaults.pagesPath#/#pagePart.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#pagePart.content#" addnewline="no" fixnewline="yes" />
      </cfloop>
      
      <cfset flashInsert(success="The page has been created successfully.")>
      <cfset redirectTo(route="pages_path")>
    <cfelse>
      <cfset flashInsert(error="There was an error creating the page.")>
  		<cfset renderPage(action="new")>
    </cfif>
  </cffunction>
  
  <cffunction name="edit">
    <cfset layouts = model('layout').findAll()>
    <cfset pageClasses = model('pageClass').findAll()>
    <cfset status = ['Draft', 'Reviewed', 'Published', 'Hidden']>
    <cfset page = model('page').findbykey(params.key)>
    <cfset pageParts = page.pageParts()>
  </cffunction>
  
  <cffunction name="update">
    <cfset layouts = model('layout').findAll()>
    <cfset pageClasses = model('pageClass').findAll()>
    <cfset status = ['Draft', 'Reviewed', 'Published', 'Hidden']>
    <cfset page = model('page').findbykey(params.key)>
    <cfset pageParts = page.pageParts()>
    <cfif page.update(params.page)>
      
      <!--- first delete all existing page parts before saving the new ones --->
      <cfloop query="pageParts">
        <cfif pageParts.fileName is NOT "" and fileExists("#application.defaults.pagesPath#/#pageParts.fileName#")>
  	      <cffile action="delete" file="#application.defaults.pagesPath#/#pageParts.fileName#">
  	    </cfif>
      </cfloop>  
      <cfset page.deleteAllPageParts()>
        
      <!--- need to loop through the pageParts that get passed in params and save them --->
      <cfloop collection="#params.pagePart#" item="item">
        <!--- have to see if this pagePart exists, if so update it, if not create it --->
        <cfset pagePart = page.newPagePart()>
        <cfset pagePart.name = item>
        <cfset pagePart.content = evaluate("params.pagePart_#item#").content>
        <cfset pagePart.fileName = dateTimeFormat(now()) & ".cfm">
        <cfset pagePart.save()>
        <cffile action="write" file="#application.defaults.pagesPath#/#pagePart.fileName#" output="<cfimport taglib='../../lib/splash/tags' prefix='s' />#pagePart.content#" addnewline="no" fixnewline="yes" />
      </cfloop>
      
  		<cfset flashInsert(success="The page was updated successfully.")>	
      <cfset redirectTo(route="pages_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the page.")>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>
  
  <cffunction name="delete">
  	<cfset page = model('page').findByKey(params.id)>
    <cfset page.deleteAllPageParts()>
      
  	<cfif page.delete()>
  		<cfset flashInsert(success="The Page was deleted successfully.")>	
      <cfset redirectTo(route="pages_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the Page.")>
  		<cfset redirectTo(route="pages_path")>
  	</cfif>
  </cffunction>
	
</cfcomponent>
