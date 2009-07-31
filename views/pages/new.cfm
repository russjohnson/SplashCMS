<script type="text/javascript">
$(document).ready(function()
{
  //hide the all of the element with class msg_body
  $(".more").hide();
  //toggle the componenet with class msg_body
  $(".hideShow").click(function()
  {
    $(".morelink").hide();
    $(".more").slideToggle(600);
    return false;
  });
  
   $(".lessClick").click(function()
  {
    $(".morelink").show();
    $(".more").slideToggle(600);
    return false;
  });
});
</script>

<h1>New Page</h1>

<cfoutput>
			
  #errorMessagesFor("page")#
	
	#startFormTag(action="create", class="form")#
		
		#hiddenField(objectName="page", property="parentid")#
				
		<p><label class="label">Page Title</label>
			#textField(objectName='page', property='title', class="text_field")#</p>
		
		<p class="morelink"><a href="" class="hideShow">more</a></p>
													
		<div class="more">
		  
		  	<p><label class="label">Slug</label>
						#textField(objectName='page', property='slug', class="text_field")#</p>
						
				<p><label class="label">Breadcrumb</label>
						#textField(objectName='page', property='breadcrumb', class="text_field")#</p>
					
				<p><label class="label">Description</label>
						#textField(objectName='page', property='description', class="text_field")#</p>	
							
				<p><label class="label">Keywords</label>
						#textField(objectName='page', property='keywords', class="text_field")#</p>
						
			<a href="" class="lessClick">less</a>
				
		</div>
		
	  <p>
	    <label class="label">Body</label>
	    #textArea(objectName="pagePart", property="content", class="text_area", rows="10")#
	  </p>
	 
	 <p>
  	<label><strong>Layout</strong></label>
  	  #select(objectName='page', property='layoutID', options=layouts, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Page Type</strong></label>
  	  #select(objectName='page', property='classID', options=pageClasses, valueField="id", textField="name")#
  	  &nbsp;&nbsp;&nbsp;&nbsp;
  	<label><strong>Status</strong></label>
  	 #select(objectName="page", property="statusID", options=status)#
  </p>
					
	  	<p>#submitTag(class="button", value="Save Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
			
</cfoutput>
