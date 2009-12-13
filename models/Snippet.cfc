<cfcomponent extends="Model" output="false">

    <cffunction name="init">        
        <cfset validatesPresenceOf(property="name" , message="Your snippet must have a name.")>
        <cfset validatesPresenceOf(property="content" , message="Your snippet must have a body.")>
        <cfset validatesLengthOf(property="name", maximum="100", message="The name of your snippet is over 100 characters.", allowBlank="true")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID')>
    </cffunction>

</cfcomponent>
