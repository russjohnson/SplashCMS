<!--- <cfdump var="#snippets#" abort /> --->
<h1>Snippets</h1>

<p>Snippets are generally small pieces of content which are included in other pages or layouts. Click on a snippet name below to edit it or click Remove to delete it.</p>

<table class="table">
    <tr>
        <th class="first">Snippet</th>
        <th class="last">&nbsp;</th>
    </tr>
    <cfoutput>#includePartial(partial=snippetsAndCategories, group="categoryid")#</cfoutput>
    <!--- <cfloop query="categories">
            <cfset snippets = model('snippet').findAllByCategoryID(value="#categories.id#")>
            <cfoutput>
                <cfif snippets.recordCount gt 0>
                    <tr>
                      <td colspan="2" class="title">#categories.name#</td>
                    </tr>
                
                    <cfloop query="snippets">
                        <tr>
                          <td>#linkTo(text="#snippets.name#", route="edit_snippet_path", key="#snippets.id#", class="snippet")#</td>
                          <td>#linkTo(text='#imageTag("remove.png")#', route='delete_snippet_path', key="#snippets.id#", confirm='Are you sure you want to delete this Snippet? This cannot be undone and you will need to remove all references to it in your pages and layouts!')#</td>
                        </tr>
                    </cfloop>
                </cfif>
            </cfoutput>
        </cfloop>
        <cfset snippets = model('snippet').findAll(where="categoryid is NULL")>
        <cfif snippets.recordCount gt 0>
            <tr>
              <td colspan="2" class="title">Uncategorized</td>
            </tr>
            <cfoutput query="snippets">
                <tr>
                  <td>#linkTo(text="#snippets.name#", route="edit_snippet_path", key="#snippets.id#", class="snippet")#</td>
                  <td>#linkTo(text='#imageTag("remove.png")#', route='delete_snippet_path', key="#snippets.id#", confirm='Are you sure you want to delete this Snippet? This cannot be undone and you will need to remove all references to it in your pages and layouts!')#</td>
                </tr>
            </cfoutput>
        </cfif> --->
</table>


<cfoutput>
	<p>#linkTo(text="<span class='new-snippet'>New Snippet</span>", route="new_snippet_path", class="button_wide")#</p>
</cfoutput>
