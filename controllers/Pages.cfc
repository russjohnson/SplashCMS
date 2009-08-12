<cfcomponent extends="lib.ModelControllerMethods">
  
  <cffunction name="init">
    <cfset layout("/layout_admin")>
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
    <cfdump var="#params#"><cfabort>
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
        <cfset pagePart.save()>
      </cfloop>
      
      <!---<cfset pagePart = page.newPagePart()>
      <cfset pagePart.name = params.pagePart['name']>
      <cfset pagePart.content = params.pagePart['content']>
      <cfset pagePart.save()>--->
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
    <cfset pagePart = page.findOnePagePart()>
  </cffunction>
  
  <cffunction name="update">
    <cfset page = model('page').findbykey(params.key)>
      
    <cfif page.update(params.page)>
      
      <cfset pagePart = model('pagePart').findByKey(params.pagePart['id'])>
      <cfset pagePart.name = params.pagePart['name']>
      <cfset pagePart.content = params.pagePart['content']>
      <cfset pagePart.update()>
  		<cfset flashInsert(success="The page was updated successfully.")>	
      <cfset redirectTo(route="pages_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error updating the page.")>
  		<cfset renderPage(action="edit")>
  	</cfif>
  </cffunction>
  
  <cffunction name="delete">
  	<cfset page = model('page').findByKey(params.id)>
	
  	<cfif page.delete()>
  		<cfset flashInsert(success="The Page was deleted successfully.")>	
      <cfset redirectTo(route="pages_path")>
  	<cfelse>
  		<cfset flashInsert(error="There was an error deleting the Page.")>
  		<cfset redirectTo(route="pages_path")>
  	</cfif>
  </cffunction>
	
</cfcomponent>
