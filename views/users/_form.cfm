<!--- we need to blank the password out to allow for updating the user without changing the password --->
<cfset user.password = "">

<cfoutput>
  <p>
	  #textField(objectName='user', property='username', label="Login", labelClass="label", class="text_field")#
	</p>
	
	<p>
		#textField(objectName='user', property='name', label="Name", labelClass="label", class="text_field")#
	</p>
	
	<p>
		#textField(objectName='user', property='email', label="Email", labelClass="label", class="text_field")#
	</p>
		
	<p>
	  #passwordField(objectName='user', property='password', label="Password", labelClass="label", class="text_field")#
	</p>
	
	<p>
		#passwordField(objectName='user', property='passwordConfirmation', label="Confirm Password", labelClass="label", class="text_field")#
	</p>
	
	<p>
	  #checkBox(objectName="user", property="admin", checkedValue="1", label="Administrator ", labelClass="label", uncheckedValue="0")#
	</p>
	
	<p>
	  #checkBox(objectName="user", property="developer", checkedValue="1", label="Developer ", labelClass="label", uncheckedValue="0")#
	</p>
</cfoutput>