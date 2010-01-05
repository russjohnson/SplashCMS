<cfcomponent extends="Controller" output="false">
      <cffunction name="wheelsExecute" access="public" returntype="any">
            <cfargument name="wheelsCommand" type="string" required="yes">
            <cfreturn evaluate(wheelsCommand)>
      </cffunction>
</cfcomponent>