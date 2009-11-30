<h1>Edit Layout</h1>

<cfoutput>

	#errorMessagesFor("layout")#
	
	#startFormTag(route="update_layout_path", class="form", key=params.key)#
		
		#includePartial('form')#
				
		#submitTag(class="ui-button ui-state-default ui-corner-all", value="Update Layout &rarr;")# or #linkTo(text="Cancel", route="layouts_path")#
				
	#endFormTag()#
	
	<cfif layout.updatedByID is NOT "">
	  #includePartial(partial='/shared/last_update', updatedByID=layout.updatedByID, updatedAt=layout.updatedAt)#
	</cfif>	
</cfoutput>