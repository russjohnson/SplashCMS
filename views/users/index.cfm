<table class="table">
  <tr>
		<th>Id</th>
		<th>Login</th>
		<th>Email</th>
		<th>Actions</th>
  </tr>
  <cfoutput query="users">
  	<tr>
		<td>
			#id#
		</td>
		<td>
			#login#
		</td>
		<td>
			#email#
		</td>
		<td>
			#linkTo(text='Show', action='show', key=id)# | 
			#linkTo(text='Edit', action='Edit', key=id)# | 
			#linkTo(text='Delete', action='Delete', key=id, confirm='Are you sure?')#
		</td>            
	  </tr>
  </cfoutput>
</table>


