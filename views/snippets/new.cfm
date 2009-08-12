<script type="text/javascript">
$(document).ready(function(){
  // Add markItUp! to your textarea in one line
	// $('textarea').markItUp( { Settings }, { OptionalExtraSettings } );
	$('#snippet-content').markItUp(mySettings);
	

	// $(textarea).markItUpRemove();
	$('.toggle').click(function() {
		if ($("#snippet-content.markItUpEditor").length === 1) {
 			$("#snippet-content").markItUpRemove();
			$("span", this).text("Show Editor");
		} else {
			$('#snippet-content').markItUp(mySettings);
			$("span", this).text("Remove Editor");
		}
 		return false;
	});
  
  
});
</script>

<div class="page-properties">
  <a href="" class="toggle"><span>Remove Editor</span></a>
</div>

<h1>New Snippet</h1>

<cfoutput>
#errorMessagesFor("snippet")#
	
	#startFormTag(route="create_snippet_path", class="form")#
	
		#includePartial('form')#
			
  	#submitTag(class="button", value="Create Snippet &rarr;")# or #linkTo(text="Cancel", route="snippets_path")#
		
	#endFormTag()#
</cfoutput>
