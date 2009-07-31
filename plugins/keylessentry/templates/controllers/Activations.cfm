<cfcomponent extends="Controller">
  
  <cffunction name="init">
    <cfset filters(through="loginProhibited") />
  </cffunction>
  
  <cffunction name="activate">
    <cfif params.activationCode is "">
      <cfset flashInsert(error="The activation code was missing, please follow the URL from your email.") />
      <cfset redirectTo(route="home") />
    </cfif>
    
    <cfset user = model("user").findOneByActivationCode(params.activationCode) />
      
    <cfif isBoolean(user)>
      <cfset flashInsert(error="We couldn't find a user with that activation code, please check your email and try again.") />
      <cfset redirectTo(route="home") />
    <cfelseif user.isActive()>
      <cfset flashInsert(warning="Your account has already been activated. You can log in below.") />
      <cfset redirectTo(route="login") />
    <cfelse>
      <cfset user.activate() />
      <cfset flashInsert(success="Your account has been successfully activated. You may login below.") />
      <cfset redirectTo(route="login") />
    </cfif>
  </cffunction>
  
</cfcomponent>