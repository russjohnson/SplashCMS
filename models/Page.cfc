<cfcomponent extends="Model" output="false">

    <cffunction name="init">
        <cfset belongsTo(name='pageLayout', class="layout", foreignKey="layoutID")>
        <cfset hasOne('pageClass')>
        <cfset hasMany('PageParts')>
        <cfset hasOne(name="author", class="user", foreignKey="createdByID")>

        <cfset validatesPresenceOf(property="title" , message="Your page must have a title.")>
        <cfset validatesPresenceOf(property="slug" , message="Your page must have a slug." )>
        <cfset validatesUniquenessOf(property="slug", message="The slug you entered already exists.")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID')>
        <cfset beforeSave('checkPublished')>
    </cffunction>


    <!--- PRIVATE METHODS --->

    <cffunction name="fixScriptTags" access="private">
        <cfargument name="code" type="string" required="true">
        <cfset var loc = arguments.code>
        <cfreturn replaceNoCase(loc, 'invalidtag', 'script', 'ALL')>
    </cffunction>

    <cffunction name="checkPublished" access="private">
        <cfif this.isNew() and this.status is 'published'>
            <cfset this.publishedAt = now()>
        <cfelseif this.StatusHasChanged() and this.status is 'published'>
            <cfset this.publishedAt = now()>
        </cfif>
    </cffunction>

</cfcomponent>


