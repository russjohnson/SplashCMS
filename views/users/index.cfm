<h1>Users</h1>

<table class="table">
  <tr>
		<th class="first">Name / Login</th>
		<th>Roles</th>
		<th class="last">&nbsp;</th>
  </tr>
  <cfoutput query="users">
  	<tr>
		  <td>
    		#linkTo(text="#name#", route="edit_user_path", key="#id#", class="user")# <span class="gray">#username#</span>
    	</td>
    	<td>
    		<cfif admin>Administrator</cfif> <cfif developer>Developer</cfif>
    	</td>
    	<td>
    	  <cfif id eq '1'>
    	    #imageTag('remove-disabled.png')#
    	  <cfelse>
    		#linkTo(text='#imageTag("remove.png")#', route='delete_user_path', id=id, confirm='Are you sure you want to delete this User? This cannot be undone!')#
    		</cfif>
    	</td>            
	  </tr>
  </cfoutput>
</table>

<cfoutput>
	<p>#linkTo(text="<span class='new-user'>New User</span>", route="new_user_path", class="button_wide")#</p>
</cfoutput>

