<cfcomponent extends="Model" output="false">

    <cffunction name="init">
		<cfset hasMany('PageParts')>
        <cfset belongsTo(name='pageLayout', class="layout", foreignKey="layoutID")>      
        <cfset belongsTo('PageClass')>
        <cfset belongsTo(name="author", class="user", foreignKey="createdByID")>

        <cfset validatesPresenceOf(property="title" , message="Your page must have a title.")>
		<cfset validatesLengthOf(properties="title,keywords,description", message="You have exceeded the maximun length", allowBlank="true", maximum="255")>
        <cfset validatesPresenceOf(property="slug" , message="Your page must have a slug." )>
        <cfset validatesUniquenessOf(property="slug", message="The slug you entered already exists.")>
		<cfset validatesLengthOf(property="slug", message="You have exceeded the maximun length for the slug", maximum="100")>
		<cfset validatesLengthOf(property="breadcrumb", message="You have exceeded the maximun length for the breadcrumb", allowBlank="true", maximum="160")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID')>
        <cfset beforeSave('checkPublished,setLayoutId')>
    </cffunction>

    <cffunction name="getChildren" access="public">
		<cfset var loc = arguments.attributeCollection >
		<cfset var childPages = "">
		
		<cfif StructKeyExists(loc, "where") >
			<cfset loc.where = "(" & loc.where>
			<cfset loc.where &= ") AND (parentID = #this.id#)">
		<cfelse>
			<cfset loc.where = "parentID = #this.id#">
		</cfif>
		
		<cfset childPages = this.findAll(argumentCollection=loc)>
  	
        <cfreturn childPages>
    </cffunction>

    <!--- PRIVATE METHODS --->

    <cffunction name="checkPublished" access="private">
        <cfif this.isNew() and this.status is 'published'>
            <cfset this.publishedAt = now()>
        <cfelseif this.StatusHasChanged() and this.status is 'published'>
            <cfset this.publishedAt = now()>
        </cfif>
    </cffunction>
    
    <cffunction name="setLayoutId" access="private">
    	<cfset var loc = {}>
    	<cfif this.layoutId IS "">
    		<cfset loc.parentPageId = this.findByKey(key=this.parentId, select="layoutId")>
    		<cfset this.layoutId = loc.parentPageId.layoutId>
    	</cfif>
    </cffunction>

</cfcomponent>


