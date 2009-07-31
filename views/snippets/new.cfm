<h1>New Snippet</h1>

<cfoutput>
#errorMessagesFor("snippet")#
	
	#startFormTag(action="create", class="form")#
	
		#includePartial('form')#
			
  	#submitTag(class="button", value="Create Snippet &rarr;")# or #linkTo(text="Cancel", route="snippets_path")#
		
	#endFormTag()#
</cfoutput>
