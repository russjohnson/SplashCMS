<h1>Edit User</h1>

<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(route="update_user_path", key=params.key, class="form")#
		
		#includePartial('form')#
		
		#submitTag(class="ui-button ui-state-default ui-corner-all", value="Update User &rarr;")# or #linkTo(text="Cancel", route="users_path")#
		
	#endFormTag()#
	
	<cfif user.updatedByID is NOT "">
	  #includePartial(name='/shared/last_update', updatedByID=user.updatedByID, updatedAt=user.updatedAt)#
	</cfif>
</cfoutput>
