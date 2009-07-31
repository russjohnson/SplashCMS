<cfcomponent extends="Model">

	<cffunction name="init">
		<cfset validatesPresenceOf(property="username", message="Username is required")>
		<cfset validatesPresenceOf(property="email" , message="Email is required.")>
		<cfset validatesPresenceOf(property="password", message="Password is required")>
		<cfset validatesPresenceOf(property="firstName" , message="First name is required")>
		<cfset validatesPresenceOf(property="lastName" , message="Last name is required")>
		<cfset validatesUniquenessOf(property="username", message="That username that is already in our system.", when="onCreate")>
		<cfset validatesUniquenessOf(property="email", message="That email already exists.")>
		<cfset validatesConfirmationOf(property="password",message="The passwords you entered did not match.") />
		<cfset validatesLengthOf(property="username", within="4,25", message="Your username must be 4 - 25 characters long", allowBlank="false")>
    <cfset validatesFormatOf(property="email", regEx="^[\_]*([a-z0-9]+(\.|\_*)?)+@([a-z][a-z0-9\-]+(\.|\-*\.))+[a-z]{2,6}$", message="That email address is not valid")>
    
		<!--- this callback is for encypting the password after validation and before saving the user --->
		<cfset beforeCreate("setPassword") />
		<cfset beforeCreate("setActivationCode") />
	</cffunction>
	
	
	<!--- KEYLESS ENTRY METHODS --->
	
	<cffunction name="activate">
	  <cfset this.activatedAt = now() />
	  <cfset this.save() />
	</cffunction>
	
	<cffunction name="isActive">
	 <cfif this.activatedAt is "">
	   <cfreturn false>
	  <cfelse>
	    <cfreturn true>
	  </cfif>
	</cffunction>
	
	<cffunction name="isPassword">
	    <cfargument name="password" type="string" required="yes">
	    <cfreturn (compare(hash(arguments.password, "SHA-512"), this.password) EQ 0) />
	</cffunction>
	
	<cffunction name="hasRole">
		<cfargument name="role" type="any" required="true" />
		
		<cfif listFind(this.assignedRoles, arguments.role)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
	
	<cffunction name="setPassword">
		<cfif structKeyExists(this,"password")>
	    	<cfset this.password = hash(this.password, "SHA-512") /> 			
		</cfif>
	</cffunction>
	
	<cffunction name="setActivationCode">
	 <cfset this.activationCode = createUUID()>
	</cffunction>
	
</cfcomponent>
