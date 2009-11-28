<!---
	This is the parent controller file that all your controllers should extend.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">
  
  <cffunction name="init">
    <cfset filters(through="loginRequired")>
  </cffunction>

	<cffunction name="congratulations">
		<cfset version = application.wheels.version>
	</cffunction>

	<cffunction name="plugins">
		<cfif get("environment") IS "production">
			<cfset renderNothing()>
		</cfif>
	</cffunction>

</cfcomponent>