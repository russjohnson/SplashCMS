<cfcomponent extends="Model">

	<!--- All initialization related tasks are done in the "init" function which is run the first time the model is requested. --->
	<cffunction name="init">
	  <cfset validatesPresenceOf(property="name" , message="Your snippet must have a name.")>
	  <cfset validatesPresenceOf(property="content" , message="Your snippet must have a body.")>
	  <cfset validatesLengthOf(property="name", maximum="100", message="The name of your snippet is over 10 characters.", allowBlank="true")>
	  
	  <cfset beforeCreate('setCreatedByID')>
	  <cfset beforeUpdate('setUpdatedByID')>
	</cffunction>

</cfcomponent>
