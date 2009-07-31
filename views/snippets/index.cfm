<h1>Snippets</h1>

<p>Snippets are generally small pieces of content which are included in other pages or layouts. Click on a snippet name below to edit it or click Remove to delete it.</p>

<table class="table">
  <tr>
    <th class="first">Snippet</th>
    <th class="last">&nbsp;</th>
  </tr>
  <cfoutput query="snippets">
  <tr>
    <td>#linkTo(text=name, route="edit_snippet_path", key=id, class="snippet")#</td>
    <td>#linkTo(text='#imageTag("remove.png")#', action='delete', key=id, confirm='Are you sure you want to delete this Snippet? This cannot be undone!')#</td>
  </tr>
  </cfoutput>
</table>


<cfoutput>
	<p>#linkTo(text="<span class='new-snippet'>New Snippet</span>", route="new_snippet_path", class="button_wide")#</p>
</cfoutput>
