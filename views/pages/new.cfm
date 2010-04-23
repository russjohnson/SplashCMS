<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<div class="page-properties">
  <button id="add_tab" class="ui-button ui-state-default ui-corner-all">Add Page Part</button> 
  <button id="hideShow" class="ui-button ui-state-default ui-corner-all">Page Properties</button>
  <button id="viewSite" class="ui-button ui-state-default ui-corner-all" onclick="window.open('/');">View Site</button>
</div>

<h1>New Page</h1>

<div id="dialog" title="Tab data">
	<form>
		<fieldset class="ui-helper-reset">
			<label for="tab_title">Title</label>
			<input type="text" name="tab_title" id="tab_title" value="" class="ui-widget-content ui-corner-all" />
		</fieldset>
	</form>
</div>

<cfoutput>
			
  #errorMessagesFor("page")#
	
	#startFormTag(route="create_page_path", parentID=params.parentID, class="form")#
		
		#hiddenField(objectName="page", property="parentid")#
				
		<p><label class="label">Page Title</label>
			#textField(objectName='page', property='title', class="text_field", maxlength="255")#</p>
													
		<div class="more">
		  
		  	<p><label class="label">Slug</label>
						#textField(objectName='page', property='slug', class="text_field slug", maxlength="100")#</p>
						
				<p><label class="label">Breadcrumb</label>
						#textField(objectName='page', property='breadcrumb', class="text_field", maxlength="160")#</p>
					
				<p><label class="label">Description</label>
						#textField(objectName='page', property='description', class="text_field", maxlength="255")#</p>	
							
				<p><label class="label">Keywords</label>
						#textField(objectName='page', property='keywords', class="text_field", maxlength="255")#</p>
		</div>
		
	  <div id="tabs">
	    <!--- navigation for tabs --->
	    <ul>
	      <!--- need to loop through the default setting and get values to build the tabs --->
	      <cfloop from="1" to="#arrayLen(application.defaults.page.parts)#" index="i">
	        <li><a href="##tabs-#application.defaults.page.parts[i]#">#application.defaults.page.parts[i]#</a> <span class="ui-icon ui-icon-close">Remove Tab</span>
	        </li>
	      </cfloop>
			</ul>
			
			<!--- tab containers --->
			<cfloop from="1" to="#arrayLen(application.defaults.page.parts)#" index="i">
	        <div id="tabs-#application.defaults.page.parts[i]#">
	          #hiddenFieldTag(name="pagePart[#application.defaults.page.parts[i]#]", value="#application.defaults.page.parts[i]#")#
              <!--- #textAreaTag(name="pagePart_#application.defaults.page.parts[i]#[content]", class="text_area", rows="15")# --->
              #richTextTag(name="pagePart_#application.defaults.page.parts[i]#[content]", class="rteditor", rows="15", editor="markitup", includeJSLibrary="false")#
	        </div>
	    </cfloop>

		</div>
	 
	   <p>
    	<label><strong>Layout</strong></label>
    	  #select(objectName='page', property='layoutID', options=layouts, valueField="id", textField="name", includeBlank="Inherit")#
    	  &nbsp;&nbsp;&nbsp;&nbsp;
    	<label><strong>Page Type</strong></label>
    	  #select(objectName='page', property='pageClassID', options=pageClasses, valueField="id", textField="name")#
    	  &nbsp;&nbsp;&nbsp;&nbsp;
    	<label><strong>Status</strong></label>
    	  #select(objectName="page", property="status", options=status)#
    </p>
					
	  <p>#submitTag(class="ui-button ui-state-default ui-corner-all", value="Save Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
			
</cfoutput>
