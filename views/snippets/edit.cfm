<h1>Edit Snippet</h1>

<cfoutput>
			
	#errorMessagesFor("snippet")#
	
	#startFormTag(route="update_snippet_path", key=params.key, class="form")#
		
		#includePartial('form')#
				
		#submitTag(class="button", value="Update Snippet &rarr;")# or #linkTo(text="Cancel", route="snippets_path")#
				
	#endFormTag()#
	
	<cfif snippet.updatedByID is NOT "">
	  #includePartial(name='/shared/last_update', updatedByID=snippet.updatedByID, updatedAt=snippet.updatedAt)#
	</cfif>
</cfoutput>