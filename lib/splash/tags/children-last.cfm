<!---
Usage:
<s:children-last [All of the options in the CFWheels findAll() function are supported]>
  ...
</s:children-last>

The <s:children-last> tag finds the last child of request.tags.page. 

Since any decendent tag expects an object, the returnAs parameter is forced to be "object".
--->

<cfif thisTag.executionMode IS "start">
	<cfset attributes.returnAs = "objects">
	<cfset request.tags.page.kids = request.tags.page.getChildren(attributeCollection = attributes) >
	<cfset request.tags.loopIndex = ArrayLen(request.tags.page.kids)>
	<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>
</cfif>
