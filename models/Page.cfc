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
	
	<cffunction name="process">
	 
    <!--- get the layout --->
	  <cfset var layout = this.pageLayout().content>
	   
	  <!--- parse the page titles in the layout --->
	  <cfif findNoCase("<pageTitle />", layout)>
      <cfset layout = replaceNoCase(layout, '<pageTitle />', this.title, "ALL")>
    </cfif>
    
    <!--- look for snippet tags in the layout and process them --->
    <cfset layout = parseSnippets(layout)>
    
    <!--- look for content tags in the layout and process them --->
    <cfset layout = parseContent(layout)>
      
    <cfset layout = fixScriptTags(layout)>
	  <cfreturn layout>
	</cffunction>
	
  <cffunction name="parseTitle">
    
  </cffunction>
  
  <cffunction name="parseContent">
    <cfargument name="content" type="string" required="true" />
    <cfset var content = arguments.content>
    <cfset var hasContent = TRUE>
    <cfset var pagePart = "">
    <cfset var splashTag = "">
    <cfset var xmlTag = "">
    <cfset var pagePartName = "">
      
    <cfloop condition=" hasContent ">
      <cfif findnocase("<content", content) >
        <cfset splashTag = getSplashTag(stripMode="disallow", myTags="content", myString="#content#", findOnly="true")>
        <cfset xmlTag = xmlParse(splashTag)>
        <cfset pagePartName = xmltag.xmlRoot.xmlAttributes.name>
        <cfset pagePart = model('pagePart').findOneByPageidAndName("#this.id#, #pagePartName#")>
        <cfif isObject(pagePart)>
          <cfset pagePart = parseSnippets(pagePart.content)>
          <cfset content = replaceNoCase(content, splashTag, pagePart)>
        <cfelse>
          <!--- if we cant find the pagePart just replace the tag with a comment --->
          <cfset content = replaceNoCase(content, splashTag, "<!-- You referenced a pagePart that doesnt exist --->")>
        </cfif>
      <cfelse>
        <cfset hasContent = FALSE>
      </cfif>
    </cfloop>
    <cfreturn content>
  </cffunction>
  
  <cffunction name="parseSnippets">
    <cfargument name="content" type="string" required="true" />
    <cfset var content = arguments.content>
    <cfset var hasSnippets = true>
    <cfset var splashTag = "">
    <cfset var xmlTag = "">
    <cfset var snippetName = "">
    <cfset var snippet = "">
    
    
    <cfloop condition=" hasSnippets ">
      <cfif findNoCase("<snippet", content)>
        <cfset splashTag = getSplashTag(stripMode="disallow", myTags="snippet", myString="#content#", findOnly="true")>
        <cfset xmlTag = xmlParse(splashTag)>
        <cfset snippetName = xmltag.xmlRoot.xmlAttributes.name>
        <cfset snippet = model('snippet').findOneByName(snippetName)>
        <cfif isObject(snippet)>
          <cfset content = replaceNoCase(content, splashTag, snippet.content)>
        <cfelse>
          <!--- if we cant find the snippet just replace the tag with a comment --->
          <cfset content = replaceNoCase(content, splashTag, "<!-- You referenced a snippet that doesnt exist --->")>
        </cfif>
      <cfelse>
        <cfset hasSnippets = FALSE>
      </cfif>
    </cfloop>
    <cfreturn content>
  </cffunction>

  <!--- PRIVATE METHODS --->
	
	<cffunction name="fixScriptTags" access="private">
    <cfargument name="code" type="string" required="true">
    <cfset var loc = arguments.code>
    <cfreturn replaceNoCase(loc, 'invalidtag', 'script', 'ALL')>
  </cffunction>

</cfcomponent>


