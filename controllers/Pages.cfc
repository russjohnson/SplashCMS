<cfcomponent extends="lib.ModelControllerMethods">
  
  <cffunction name="init">
    <cfset layout("/layout_admin")>
  </cffunction>
  
  <cffunction name="new">
    <cfset page = model('page').new()>
    <cfset page.parentid = params.parentid>
    <cfset layouts = model('layout').findAll()>
    <cfset pageClasses = model('pageClass').findAll()>
    <cfset status = ['Draft', 'Reviewed', 'Published', 'Hidden']>
    <cfset pagePart = model('pagePart').new()>
    <cfset pagePart.name = 'body'>
  </cffunction>
	
</cfcomponent>
