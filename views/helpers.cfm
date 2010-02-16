<!--- Place helper functions here that should be available for use in all view pages of your application --->
<cffunction name="loginRequired">
	<cfif Not structKeyExists(session,"currentUser")>
		<!---<cfset flashInsert(error="You do not have permissions to do that!")>--->
		<cfset redirectTo(route="login")>
	</cfif>
</cffunction>

<cffunction name="loginProhibited">
	<cfif structKeyExists(session,"currentUser")>
		<cfset flashInsert(error="You are logged in, you cant do that!")>
		<cfset redirectTo(route="home")>
	</cfif>
</cffunction>

<cffunction name="isLoggedIn">
    <cfif structKeyExists(session, "currentUser")>
        <cfreturn true>
    <cfelse>
        <cfreturn false>
    </cfif>
</cffunction>

<cffunction name="isAdmin">
    <cfif structKeyExists(session, "currentUser") and NOT session.currentUser.isAdmin>
        <cfset flashInsert(error="You do not have permissions to do that!")>
    	<cfset redirectTo(route="home")>
    </cfif>
</cffunction>