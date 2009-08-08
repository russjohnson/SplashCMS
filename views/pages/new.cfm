<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<script type="text/javascript">
$(document).ready(function(){
  // slug function
  $("#page-title").slug({hide: false});
  
  $(".more").hide();
  $(".hideShow").click(function(){
    $(".more").slideToggle(600);
    return false;
  });
  
  // Add markItUp! to your textarea in one line
	// $('textarea').markItUp( { Settings }, { OptionalExtraSettings } );
	$('#pagePart-content').markItUp(mySettings);
	

	// $(textarea).markItUpRemove();
	$('.toggle').click(function() {
		if ($("#pagePart-content.markItUpEditor").length === 1) {
 			$("#pagePart-content").markItUpRemove();
			$("span", this).text("Show Editor");
		} else {
			$('#pagePart-content').markItUp(mySettings);
			$("span", this).text("Remove Editor");
		}
 		return false;
	});
  
  
});
</script>

<div class="page-properties">
  <a href="" class="hideShow">Page Properties</a> <a href="" class="toggle"><span>Remove Editor</span></a>
</div>

<h1>New Page</h1>

<cfoutput>
			
  #errorMessagesFor("page")#
	
	#startFormTag(route="create_page_path", parentID=params.parentID, class="form")#
		
		#hiddenField(objectName="page", property="parentid")#
				
		<p><label class="label">Page Title</label>
			#textField(objectName='page', property='title', class="text_field")#</p>
													
		<div class="more">
		  
		  	<p><label class="label">Slug</label>
						#textField(objectName='page', property='slug', class="text_field slug")#</p>
						
				<p><label class="label">Breadcrumb</label>
						#textField(objectName='page', property='breadcrumb', class="text_field")#</p>
					
				<p><label class="label">Description</label>
						#textField(objectName='page', property='description', class="text_field")#</p>	
							
				<p><label class="label">Keywords</label>
						#textField(objectName='page', property='keywords', class="text_field")#</p>
		</div>
		
	  <p>
	    <label class="label">Body</label>
	    #hiddenField(objectName="pagePart", property="name")#
	    #textArea(objectName="pagePart", property="content", class="text_area", rows="15")#
	  </p>
	 
	 <p>
  	<label><strong>Layout</strong></label>
  	  #select(objectName='page', property='layoutID', options=layouts, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Page Type</strong></label>
  	  #select(objectName='page', property='pageClassID', options=pageClasses, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Status</strong></label>
  	 #select(objectName="page", property="status", options=status)#
  </p>
					
	  	<p>#submitTag(class="button", value="Save Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
			
</cfoutput>
