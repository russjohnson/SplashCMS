<cfif thisTag.executionMode IS "start">
  
    <cfparam name="attributes.part" default="">
    <cfparam name="page" default="#request.page#">

    <cfset wheelsProxy=CreateObject("component","controllers.Controller") >
 
    <cfset pagePart = wheelsProxy.wheelsExecute("model('pagePart').findByPage(pageID=#page.ID#, part = '#attributes.part#')")>
    
    <cfif isObject(pagePart)>
        <cfoutput>
        <cfif pagePart.fileName is Not "">
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
              <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
            <cfelse>
                <cfset pagePart.write()>
                <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                    <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
                </cfif>
            </cfif>
        <cfelse>
            <cfset pagePart.fileName = createUUID()>
            <cfset pagePart.write()>
            <cfset pagePart.save()>
            <cfif fileExists(expandPath("#application.defaults.rootPath#public/pages/#pagePart.filename#"))>
                <cfinclude template="#application.defaults.rootPath#public/pages/#pagePart.filename#">
            </cfif>
        </cfif>
        </cfoutput>
    </cfif>
</cfif>