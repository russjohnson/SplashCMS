<h1>Edit User</h1>

<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(route="update_user_path", key=params.key, class="form")#
		
		#includePartial('form')#
		
		#submitTag(class="button", value="Update User &rarr;")# or #linkTo(text="Cancel", route="users_path")#
		
	#endFormTag()#
</cfoutput>
