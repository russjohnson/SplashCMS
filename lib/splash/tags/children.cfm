<cfif thisTag.executionMode IS "start">
  <cfparam name="attributes.order" default="" type="string" />
  <cfparam name="attributes.maxRows" default="-1" type="numeric" />
  <cfparam name="attributes.page" default="#request.page#" type="struct" />

  <cfquery name="childPages" datasource="#application.wheels.dataSourceName#" username="#application.wheels.dataSourceUserName#" password="#application.wheels.dataSourcePassword#" maxrows="#attributes.maxRows#">
    SELECT * FROM pages
    WHERE parentID = #attributes.page.id# AND status = 'Published'
    
    <!--- If an "order by" is defined --->
    <cfif attributes.order IS NOT "">
    	ORDER BY #attributes.order#
    </cfif>
  </cfquery>
</cfif>

<cfif thisTag.executionMode IS "end">
	<cfset data = thisTag.generatedContent>
	<cfset thisTag.generatedContent = "">
	
	<cfoutput query="childPages">
		#Evaluate(DE(data))#
	</cfoutput>	
</cfif>
