<cfscript>
    if (thisTag.executionMode == 'start'){
        url = request.page.slug;
        title = request.page.title;
        urlString = '<a href="';
    }
    
    if (thisTag.executionMode == 'end'){
        if (len(thisTag.generatedContent)){
            linkText = thisTag.generatedContent;
            thisTag.generatedContent = "";
        } else {
            linkText = title;
        }
        
        urlString = urlString & request.page.slug & '">' & linkText & '</a>';
        writeOutput(urlString);
    }
</cfscript>