<cfif thisTag.executionMode is "start">
    <cfparam name="attributes.noLinks" default="false">
      
    <cfscript>
    /**
    * Reverses the order of elements in a one-dimensional array.
    *
    * @param InArray      One-dimensional array to be reversed.
    * @return Returna a new one dimensional array.
    * @author Raymond Simmons (raymond@terraincognita.com)
    * @version 1.0, October 9, 2001
    */
    function ArrayReverse(inArray){
        var outArray = ArrayNew(1);
        var i=0;
        var j = 1;
            for (i=ArrayLen(inArray);i GT 0;i=i-1){
                outArray[j] = inArray[i];
                j = j + 1;
            }
            return outArray;
        }
    </cfscript>
  
      <cfset crumbs = []>
      <cfset links = []>
      <cfset i = 2>
      <cfset breadCrumbs = "">  
    
      <cfset thisPage = request.page>
      <cfset crumbs[1] = thisPage.title>
      <cfset links[1] = thisPage.slug>
    
      <cfset currentCrumb = thisPage.parentid>

      <cfloop condition="currentCrumb is NOT 0">
        <cfquery name="parent" datasource="#application.wheels.dataSourceName#" maxrows="1">
          select * from pages
          where ID = #currentCrumb#
        </cfquery>
    
        <cfif parent.recordCount gt 0>
          <cfset crumbs[i] = parent.title>
          <cfset links[i] = parent.slug>
          <cfset currentCrumb = parent.parentID>
        <cfelse>
          <cfset currentCrumb = 0>
        </cfif>
        <cfset i = i + 1>
      </cfloop>
  
        <cfset crumbs = arrayReverse(crumbs)>
        <cfset links = arrayReverse(links)>

      <cfset breadCrumbs = '<ul class="crumbs">'>

      <cfloop from="1" to="#arrayLen(crumbs)#" index="i">
        <cfset breadCrumbs = breadCrumbs & "<li>" & '<a href="#links[i]#">#crumbs[i]#</a>' & "</li>">
      </cfloop>
      <cfset breadCrumbs = breadCrumbs & "</ul>">
      <cfoutput>#breadcrumbs#</cfoutput>
</cfif>