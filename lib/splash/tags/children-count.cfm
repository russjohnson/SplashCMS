<!---
Usage:
<s:children-count [All of the options in the CFWheels findAll() function are supported]>
  ...
</s:children-count>

NOTE: This tag MUST be nested inside a <s:children-each> tag.

The <s:children-count> counts the number of children of request.tags.page. 
--->

<cfif thisTag.executionMode IS "start">
	<!--- Check to make sure the parent tag is children-each --->
	<cfset parentTag = ListGetAt(GetBaseTagList(),2)>
	<cfif trim(parentTag) NEQ "CF_CHILDREN-EACH">
		<!--- Throw an error --->	
		<cfexit method="exittag" />
	</cfif>	
	
	<cfset request.tags.childrenCount = ArrayLen(request.tags.page.kids)>
	<cfoutput>#request.tags.childrenCount#</cfoutput>
</cfif>
