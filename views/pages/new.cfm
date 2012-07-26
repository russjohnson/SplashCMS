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
				
		<p>
			#textField(objectName='page', property='title', class="text_field", maxlength="255", label="Page Title", labelClass="label")#
		</p>
													
		<div class="more">
			<p>
				#textField(objectName='page', property='slug', class="text_field slug", maxlength="100", label="Slug", labelClass="label")#
			</p>
			<p>
				#textField(objectName='page', property='breadcrumb', class="text_field", maxlength="160", label="Breadcrumb", labelClass="label")#
			</p>
			<p>
				#textField(objectName='page', property='description', class="text_field", maxlength="255", label="Description", labelClass="label")#
			</p>	
			<p>
				#textField(objectName='page', property='keywords', class="text_field", maxlength="255", label="Keywords", labelClass="label")#
			</p>
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
              #richTextTag(name="pagePart_#application.defaults.page.parts[i]#[content]", class="rteditor", rows="15", editor="ckeditor", includeJSLibrary="false")#
	        </div>
	    </cfloop>

		</div>
	 
	  <p>
			#select(objectName='page', property='layoutID', label="<strong>Layout </strong>", options=layouts, valueField="id", textField="name", includeBlank="Inherit")#
    	&nbsp;&nbsp;&nbsp;&nbsp;
   	  #select(objectName='page', property='pageClassID', label="<strong>Page Type 
</strong>", options=pageClasses, valueField="id", textField="name")#
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	#select(objectName="page", property="status", label="<strong>Status </strong>", options=status)#
			&nbsp;&nbsp;&nbsp;&nbsp;
			#textField(objectName="page", property="pageorder", label="Page Order ", labelPlacement="before", class="text_field", style="width:20px;")#
    </p>
					
	  <p>#submitTag(class="ui-button ui-state-default ui-corner-all", value="Save Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
			
</cfoutput>
