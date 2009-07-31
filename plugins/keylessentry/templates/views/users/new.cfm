<h2>Sign up</h2>

<cfoutput>
	#errorMessagesFor("user")#

	#startFormTag(action="create")#
	
	  <p>
	    <label>Username</label>
		  #textField(objectName='user', property='username')#
		</p>
		
		<p>
		  <label>First Name</label>
			#textField(objectName='user', property='firstName')#
		</p>
		
		<p>
		  <label>Last Name</label>
			#textField(objectName='user', property='lastName')#
		</p>
					
		<p>
		  <label>Email</label>
			#textField(objectName='user', property='email')#
		</p>
			
		<p>
		  <label>Password</label>
		  #textField(objectName='user', property='password')#
		</p>
		
		<p>
		  <label>Confirm Password</label>
			#textField(objectName='user', property='passwordConfirmation')#
		</p>

	#submitTag()#
		
	#endFormTag()#
</cfoutput>
