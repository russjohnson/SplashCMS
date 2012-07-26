<cfoutput>
<p>
	#textField(objectName='layout', property='name', label="Name", labelClass="label", class="text_field")#
</p>

<p>
	#richTextField(objectName='layout', property='content', label="Body", labelClass="label", class="rteditor", rows="15", editor="markitup", includeJSLibrary="false")#</p>
</cfoutput>