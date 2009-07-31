<h1>New Layout</h1>

<cfoutput>
			
	#errorMessagesFor("layout")#

	#startFormTag(action="create", class="form")#

    #includePartial('form')#
    
		#submitTag(class="button", value="Create Layout &rarr;")# or #linkTo(text="Cancel", route="layouts_path")#
				
	#endFormTag()#
</cfoutput>
