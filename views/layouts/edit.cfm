<h1>Edit Layout</h1>

<cfoutput>

	#errorMessagesFor("layout")#
	
	#startFormTag(action="update", class="form", key=params.key)#
		
		#includePartial('form')#
				
		#submitTag(class="button", value="Update Layout &rarr;")# or #linkTo(text="Cancel", route="layouts_path")#
				
	#endFormTag()#
			
</cfoutput>