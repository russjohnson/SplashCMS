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
			<th>Order</th>
	    <th>Status</th>
	    <th class="last">&nbsp;</th>
	</tr>
  </thead>
  <tbody>
  <cfoutput query="pages">
    <tr id="node-#id#" class="<cfif NOT parentid eq 0>child-of-node-#parentid#</cfif>">
      <td>
        <cfif pageClassID is "2">
          <cfset pageTitle = title & ' <span class="small gray">(File Not Found)</span>'>
        <cfelse>
          <cfset pageTitle = title>
        </cfif>
        #linkTo(text=pageTitle, route="edit_page_path", key=id, parentID=parentid, class="page")#
      </td>
			<td<cfif !parentid is 1 and !parentid is 0> style="color:##ccc;"</cfif>>#pageorder#</td>
      <td><cfif status is "Draft"><span class="red">#status#</span><cfelse>#status#</cfif></td>
      <td>
          #linkTo(text='#imageTag("add-child.png")#', route='new_page_path', parentid=id)#
        <cfif parentId is '0'>
          #imageTag("remove-disabled.png")#
        <cfelse>
          #linkTo(text='#imageTag("remove.png")#', route='delete_page_path', key=id, confirm='Are you sure you want to delete this Page? This cannot be undone!')#
        </cfif>
      </td>
    </tr>
  </cfoutput>
  </tbody>
</table>
