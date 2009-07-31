<cfcomponent extends="Model">

	<!--- All initialization related tasks are done in the "init" function which is run the first time the model is requested. --->
	<cffunction name="init">
	  <cfset hasOne('layout')>
	  <cfset hasOne('pageClass')>
	  <cfset hasMany('PageParts')>
	  <cfset hasOne(name="parent", class="Page", foreignKey="parentID")>
	  <cfset hasMany(name="children", class="Page", foreignKey="parentID")>
	    
	  <cfset beforeCreate('setCreatedByID')>
	  <cfset beforeUpdate('setUpdatedByID')>
	</cffunction>

</cfcomponent>
