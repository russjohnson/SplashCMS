<h1>New User</h1>

<cfoutput>
	#errorMessagesFor("user")#

	#startFormTag(route="create_user_path", class="form")#
	
	  #includePartial('form')#

	  #submitTag(class="ui-button ui-state-default ui-corner-all", value="Create User &rarr;")# or #linkTo(text="Cancel", route="users_path")#
		
	#endFormTag()#
</cfoutput>

