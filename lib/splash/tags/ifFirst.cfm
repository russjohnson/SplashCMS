<!---
Usage:
<s:children-each>
  <s:ifFirst>
    ...
  </s:ifFirst>
</s:children-each>

NOTE: This tag MUST be nested inside a <s:children-each> tag.

The <s:ifFirst> checks to see if the currentChild is the first one in a children-each collection. If so, it 
passes the currentChild page to decendent tags as request.tags.currentChild.

If the currentChild is not first, the tag terminates.
--->

<cfif thisTag.executionMode IS "start">
	<!--- Check to make sure the parent tag is children-each --->
	<cfset parentTag = ListGetAt(GetBaseTagList(),2)>
	<cfif trim(parentTag) NEQ "CF_CHILDREN-EACH">
		<!--- Throw an error --->	
		<cfexit method="exittag" />
	</cfif>
	
	<cfif request.tags.loopIndex NEQ 1>
		<cfexit method="exittag" />
	<cfelse>
		<cfset request.tags.currentChild = request.tags.page.kids[request.tags.loopIndex]>
	</cfif>
</cfif>

