<cfoutput>
<p><label class="label">Name</label>
#textField(objectName='snippet', property='name', class="text_field")#</p>

<p><label class="label">Category</label>
#selectTag(name="categoryid", options="#categories#")# 
<a id="add-new" class="ui-button ui-state-default ui-corner-all">add new</a></p>

<p><label class="label">Body</label>
#textArea(objectName='snippet', property='content', class="text_area", rows="15")#</p>
</cfoutput>