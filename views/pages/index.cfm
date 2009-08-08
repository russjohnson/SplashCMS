<script type="text/javascript">
    $(document).ready(function()  {
      $("#pageTree").treeTable();
      
      // expand the home node by default
      $("#node-1").expand();
    });
  </script>

<h1>Pages</h1>

<table id="pageTree" class="table">
  <thead>
  <tr>
    <th class="first">Page</th>
    <th>Status</th>
    <th class="last">&nbsp;</th>
  </tr>
  </thead>
  <tbody>
  <cfoutput query="pages">
    <tr id="node-#id#" class="<cfif NOT parentid eq 0>child-of-node-#parentid#</cfif>">
      <td>
        #linkTo(text=title, route="edit_page_path", key=id, parentID=parentid, class="page")#
      </td>
      <td>#status#</td>
      <td>
        #linkTo(text='#imageTag("add-child.png")#', route='new_page_path', parentid=id)#
        #linkTo(text='#imageTag("remove.png")#', action='delete', key=id, confirm='Are you sure you want to delete this Layout? This cannot be undone!')#
      </td>
    </tr>
  </cfoutput>
  </tbody>
</table>
