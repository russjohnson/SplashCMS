<cfif thisTag.executionMode is "start">
  <cfparam name="attributes.urls" type="string" default="" />
  <cfparam name="attributes.id" type="string" default="" />
  <cfparam name="attributes.class" type="string" default="" />
  <cfparam name="attributes.currentClass" type="string" default="" />
  
  <cfset navigation = "<ul">
  <cfif attributes.id is NOT ''>
    <cfset navigation = navigation & ' id="' & attributes.id & '"'>
  </cfif>
  <cfif attributes.class is NOT ''>
    <cfset navigation = navigation & ' class="' & attributes.class & '"'>
  </cfif>  
  <cfset navigation = navigation & '>'>
  
  <cfif application.wheels.URLRewriting EQ "Partial">
  	<cfset partialHref = "/index.cfm">
  <cfelse>
    <cfset partialHref = "">
  </cfif>

  <cfloop list="#attributes.urls#" index="item" delimiters="|">
    <cfset href = trim(listLast(item, ':'))>
    <cfset label = trim(listFirst(item, ':'))>
    
    <cfif href NEQ "/">
        <cfset href = partialHref & href>
    </cfif>
    
    <cfif request.page.slug is listLast(href, '/')>
      <cfset navigation = navigation & '<li' & ' class="' & attributes.currentClass & '">' & '<a href="#href#">' & label & '</a>' & '</li>'>
    <cfelse>
      <cfset navigation = navigation & '<li>' & '<a href="#href#">' & label & '</a>' & '</li>'>
    </cfif>
  </cfloop>
  
  <cfset navigation = navigation & "</ul>">
  
  <cfoutput>#navigation#</cfoutput>
</cfif>
