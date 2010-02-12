<!---
Usage:
<s:children-first [All of the options in the CFWheels findAll() function are supported]>
  ...
</s:children-first>

The <s:children-first> tag finds the first child of request.tags.page. 

Since any decendent tag expects an object, the returnAs parameter is forced to be "object".
--->

<cfif thisTag.executionMode IS "start">
	<cfset attributes.returnAs = "objects">
	<cfset request.tags.page.kids = request.tags.page.getChildren(attributeCollection = attributes) >
	<cfset request.tags.loopIndex = 1>
	<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>
</cfif>
