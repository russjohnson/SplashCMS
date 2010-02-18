<!---
Usage:
<s:children-each [All of the options in the CFWheels findAll() function are supported]>
  ...
</s:children-each>

The <s:children-each> tag finds all the children of request.tags.page.

The children are stored as an array of objects in request.tags.page.kids. Then, the tag loops over all the objects,
and passes each value to decendent tags as request.tags.currentChild.

Since any decendent tag expects an object, the returnAs parameter is forced to be "object".
--->

<cfif thisTag.executionMode IS "start">
	<cfset attributes.returnAs = "objects">
	
	<!--- TODO: Find a way to not re-run getChildren if you already have the right data --->
	<cfset request.tags.page.kids = request.tags.page.getChildren(attributeCollection = attributes) >
	<cfset request.tags.loopIndex = 1>
	<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>
</cfif>

<cfif thisTag.executionMode IS "end">
	<cfset request.tags.loopIndex++ >
	
	<cfif request.tags.loopIndex LTE ArrayLen(request.tags.page.kids)>
		<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>	
		<cfexit method="loop" />
	<cfelse>
		<cfexit method="exittag" />
	</cfif>
</cfif>
