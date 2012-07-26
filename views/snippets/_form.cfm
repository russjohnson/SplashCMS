<cfoutput>
	<p>
		#textField(objectName='snippet', property='name', label="Name", labelClass="label", class="text_field")#
	</p>

	<p>
		#select(objectName="snippet", property="categoryid", label="Category", labelClass="label", options="#categories#", includeBlank="true")# 
		<a id="add-new" class="ui-button ui-state-default ui-corner-all">add new</a><br/>
		<span class="description">Categories are simply a way to organize your snippets.</span>
	</p>

	<p>
		#richTextField(objectName='snippet', property='content', label="Content", labelClass="label", class="rteditor", rows="15", editor="markitup", includeJSLibrary="false")#
	</p>
</cfoutput>