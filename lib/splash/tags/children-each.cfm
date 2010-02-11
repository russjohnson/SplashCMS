<!--- TODO:
	Figure out how to loop over the children
  --->

<cfif thisTag.executionMode IS "start">
	<cfset request.tags.page.kids = request.tags.page.getChildren(attributeCollection = attributes) >
</cfif>

<cfif thisTag.executionMode IS "Inactive">
	<cfset kids = request.tags.page.getChildren(attributeCollection = attributes) >

</cfif>

<cfif thisTag.executionMode IS "end">
	<cfset data = thisTag.generatedContent>
	<cfset thisTag.generatedContent = "">
	
	<cfoutput query="childPages">
		<cfset request.tags.page = found>
		#Evaluate(DE(data))#
	</cfoutput>	
</cfif>
<!---
<r:children:each [offset="number"] [limit="number"] [by="attribute"] [order="asc|desc"] [status="draft|reviewed|published|hidden|all"]>
  ...
</r:children:each>

  desc %{
    Cycles through each of the children. Inside this tag all page attribute tags
    are mapped to the current child page.

    *Usage:*
    
    <pre><code><r:children:each [offset="number"] [limit="number"] [by="attribute"] [order="asc|desc"]
     [status="draft|reviewed|published|hidden|all"]>
     ...
    </r:children:each>
    </code></pre>
  }
  
  tag 'children:each' do |tag|
    options = children_find_options(tag)
    result = []
    children = tag.locals.children
    tag.locals.previous_headers = {}
    kids = children.find(:all, options)
    kids.each_with_index do |item, i|
      tag.locals.child = item
      tag.locals.page = item
      tag.locals.first_child = i == 0
      tag.locals.last_child = i == kids.length - 1
      result << tag.expand
    end
    result
  end
--->


