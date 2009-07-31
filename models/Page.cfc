<cfcomponent extends="Model">

	<!--- All initialization related tasks are done in the "init" function which is run the first time the model is requested. --->
	<cffunction name="init">
	  <cfset belongsTo(name='pageLayout', class="layout", foreignKey="layoutID")>
	  <cfset hasOne('pageClass')>
	  <cfset hasMany('PageParts')>
	  <cfset hasOne(name="parent", class="Page", foreignKey="parentID")>
	  <cfset hasMany(name="children", class="Page", foreignKey="parentID")>
	    
	  <cfset validatesPresenceOf(property="title" , message="Your page must have a title.")>
	  <cfset validatesPresenceOf(property="slug" , message="Your page must have a slug." )>
	  <cfset validatesUniquenessOf(property="slug", message="The slug you entered already exists.")>
	    
	  <cfset beforeCreate('setCreatedByID')>
	  <cfset beforeUpdate('setUpdatedByID')>
	</cffunction>

</cfcomponent>
