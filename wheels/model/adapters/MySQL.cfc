<cfcomponent extends="Base" output="false">
    <!--- <cffunction name="init" access="public" returntype="any" output="false">
          <cfargument name="datasource" type="string" required="true">
          <cfargument name="username" type="string" required="true">
          <cfargument name="password" type="string" required="true">
          <cfset super.init(argumentCollection=arguments) />
          <cfreturn this>
        </cffunction> --->
        <cffunction name="init" access="public" returntype="any" output="false">
<cfreturn super.init(argumentCollection=arguments)>
</cffunction>
	<cfinclude template="mysql/functions.cfm">
	<cfinclude template="../../plugins/injection.cfm">
</cfcomponent>