<script type="text/javascript">
  $(document).ready(function(){
  	$('#snippet-content').markItUp(mySettings);
  });
</script>

<div class="page-properties">
  <button id="viewSite" class="ui-button ui-state-default ui-corner-all" onclick="window.open('/');">View Site</button>
</div>

<h1>New Snippet</h1>

<cfoutput>
#errorMessagesFor("snippet")#
	
	#startFormTag(route="create_snippet_path", class="form")#
	
		#includePartial('form')#
			
  	#submitTag(class="ui-button ui-state-default ui-corner-all", value="Create Snippet &rarr;")# or #linkTo(text="Cancel", route="snippets_path")#
		
	#endFormTag()#
</cfoutput>
