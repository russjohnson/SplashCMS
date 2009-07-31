<!--- we need to blank the password out to allow for updating the user without changing the password --->
<cfset user.password = "">

<cfoutput>
  <p>
    <label class="label">Login</label>
	  #textField(objectName='user', property='username', class="text_field")#
	</p>
	
	<p>
	  <label class="label">Name</label>
		#textField(objectName='user', property='name', class="text_field")#
	</p>
	
	<p>
	  <label class="label">Email</label>
		#textField(objectName='user', property='email', class="text_field")#
	</p>
		
	<p>
	  <label class="label">Password</label>
	  #passwordField(objectName='user', property='password', class="text_field")#
	</p>
	
	<p>
	  <label class="label">Confirm Password</label>
		#passwordField(objectName='user', property='passwordConfirmation', class="text_field")#
	</p>
	
	<p>
	  <label class="label">Administrator
	  #checkBox(objectName="user", property="admin", checkedValue="1", uncheckedValue="0")#</label>
	</p>
	
	<p>
	  <label class="label">Developer
	  #checkBox(objectName="user", property="developer", checkedValue="1", uncheckedValue="0")#</label>
	</p>
</cfoutput>