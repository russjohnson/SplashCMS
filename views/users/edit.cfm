<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(action="update", class="form")#
		
		<div class="group">
			#hiddenField(objectName='user', property='id')#
		</div>	
		
		<div>
			#textField(objectName='user', property='login', label='Username <em>*</em>')#
		</div>	

		<div>
			#textField(objectName='user', property='email', label='Email <em>*</em>')#
		</div>	
		
		<div>
			<cfloop query="roles">
				<input type="checkbox" name="user[assignedRoles]" id="user-assigned-roles" value="#roles.name#" <cfif listfind("#user.assignedRoles#", "#roles.name#")>checked</cfif>> #roles.name#<br/>
			</cfloop>
		</div>		

		<div class="clear"></div>
		<div class="group navform">
			#submitTag()#
		</div>
		
	#endFormTag()#
	

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
