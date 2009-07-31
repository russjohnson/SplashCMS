<h1>New Layout</h1>

<cfoutput>
			
	#errorMessagesFor("layout")#

	#startFormTag(route="create_layout_path", class="form")#

    #includePartial('form')#
    
		#submitTag(class="button", value="Create Layout &rarr;")# or #linkTo(text="Cancel", route="layouts_path")#
				
	#endFormTag()#
</cfoutput>
