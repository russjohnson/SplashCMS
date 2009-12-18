<cfif thisTag.executionMode is "start">
    <cfoutput>#request.page.author().name#</cfoutput>
</cfif>