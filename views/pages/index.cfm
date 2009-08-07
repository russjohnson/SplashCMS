<h1>Pages</h1>

<table class="table">
  <tr>
    <th class="first">Page</th>
    <th>Status</th>
    <th class="last">&nbsp;</th>
  </tr>
  <cfoutput query="pages">
  <tr>
    <td>
      <cfif parentid eq ''>
        #linkTo(text=title, route="edit_home_page_path", key=id, class="page")#
      <cfelse>
        #linkTo(text=title, route="edit_page_path", key=id, parentID=parentid, class="page")#
      </cfif>
    </td>
    <td>#status#</td>
    <td>
      #linkTo(text='#imageTag("add-child.png")#', route='new_page_path', parentid=id)#
      <cfif parentID is ''>
        #imageTag('remove-disabled.png')#
      <cfelse>
        #linkTo(text='#imageTag("remove.png")#', action='delete', key=id, confirm='Are you sure you want to delete this Layout? This cannot be undone!')#
      </cfif>
    </td>
  </tr>
  </cfoutput>
</table>
