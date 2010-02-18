<!--- <cfdump var="#loc#" abort /> --->
<cfoutput>
    <cfif loc.categoryName is Not "">
    <tr>
      <td colspan="2" class="title">#loc.categoryName#</td>
    </tr>
    </cfif>

    <cfloop query="loc.group">
        <tr>
          <td>#linkTo(text="#loc.group.name#", route="edit_snippet_path", key="#loc.group.id#", class="snippet")#</td>
          <td>#linkTo(text='#imageTag("remove.png")#', route='delete_snippet_path', key="#loc.group.id#", confirm='Are you sure you want to delete this Snippet? This cannot be undone and you will need to remove all references to it in your pages and layouts!')#</td>
        </tr>
    </cfloop>
</cfoutput>