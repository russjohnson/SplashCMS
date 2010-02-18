<!---
Usage:
<s:children-each>
  <s:unlessFirst>
    ...
  </s:unlessFirst>
</s:children-each>

NOTE: This tag MUST be nested inside a <s:children-each> tag.

The <s:unlessFirst> checks to see if the currentChild is the first one in a children-each collection. If not, it 
passes the currentChild page to decendent tags as request.tags.currentChild.

If the currentChild is the first child, the tag terminates.
--->

<cfif thisTag.executionMode IS "start">
	<!--- Check to make sure the parent tag is children-each --->
	<cfset parentTag = ListGetAt(GetBaseTagList(),2)>
	<cfif trim(parentTag) NEQ "CF_CHILDREN-EACH">
		<!--- Throw an error --->	
		<cfexit method="exittag" />
	</cfif>
	
	<cfif request.tags.loopIndex IS 1>
		<cfexit method="exittag" />
	<cfelse>
		<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>
	</cfif>
</cfif>