<h1>Layouts</h1>

<p>Use layouts to apply a visual look to a Web page. Layouts can contain SplashTags to include page content and other elements such as the header or footer using snippets. Click on a layout name below to edit it or click Remove to delete it.</p>

<table class="table">
  <thead>
	  <tr>
	    <th class="first">Layout</th>
	    <th class="last">&nbsp;</th>
	  </tr>
  </thead>
  <tbody>
	  <cfoutput query="layouts">
	  <tr id="order_#id#">
	    <td>#linkTo(text=name, route="edit_layout_path", key=id, class="layout")#</td>
	    <td>#linkTo(text='#imageTag("remove.png")#', route='delete_layout_path', key=id, confirm='Are you sure you want to delete this Layout? This cannot be undone!')#</td>
	  </tr>
	  </cfoutput>
  </tbody>
</table>


<cfoutput>
	<p>#linkTo(text="<span class='new-layout'>New Layout</span>", route="new_layout_path", class="button_wide")#</p>
</cfoutput>

<script type="text/javascript">
	// Return a helper with preserved width of cells
	var fixHelper = function(e, ui) {
		ui.children().each(function() {
			$(this).width($(this).width());
		});
		return ui;
	};
	
	$(".table tbody").sortable({
		helper: fixHelper,
		update: function(event, ui) { 
	   				var order = $(this).sortable('toArray');
			
	   				$.ajax({
					      url: "/admin/layouts/reorder/" + order,
					      type: "POST",
					      success: function(msg){
					         $(".table tbody").effect("highlight", {}, 1000);
					      }
					   });
	   			}
	}).disableSelection();
</script>