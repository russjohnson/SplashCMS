<h1>Layouts</h1>

<p>Use layouts to apply a visual look to a Web page. Layouts can contain SplashTags to include page content and other elements such as the header or footer using snippets. Click on a layout name below to edit it or click Remove to delete it.</p>

<table class="table">
  <tr>
    <th class="first">Layout</th>
    <th class="last">&nbsp;</th>
  </tr>
  <cfoutput query="layouts">
  <tr>
    <td>#linkTo(text=name, route="edit_layout_path", key=id, class="layout")#</td>
    <td>#linkTo(text='#imageTag("remove.png")#', route='delete_layout_path', key=id, confirm='Are you sure you want to delete this Layout? This cannot be undone!')#</td>
  </tr>
  </cfoutput>
</table>


<cfoutput>
	<p>#linkTo(text="<span class='new-layout'>New Layout</span>", route="new_layout_path", class="button_wide")#</p>
</cfoutput>