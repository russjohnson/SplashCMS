<cfif thisTag.executionMode is "start">
  <cfparam name="attributes.orderDirection" default="ASC" type="string" />
  <cfparam name="attributes.orderColumn" default="" type="string" />
  <cfparam name="attributes.maxRows" default="-1" type="numeric" />
  <cfparam name="attributes.page" default="#request.page#" type="struct" />

  <cfquery name="childPages" datasource="#caller.get('dataSourceName')#">
    SELECT * FROM pages
    WHERE parentID = #attributes.page.id# AND status = 'Published'
    
    <!--- If an order by defined --->
    <cfif attributes.orderColumn IS NOT "">
    	ORDER BY #attributes.orderColumn# #attributes.orderDirection#
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
