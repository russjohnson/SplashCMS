<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<div class="page-properties">
  <button id="add_tab" class="ui-button ui-state-default ui-corner-all">Add Page Part</button> 
  <button id="hideShow" class="ui-button ui-state-default ui-corner-all">Page Properties</button>
  <button id="viewSite" class="ui-button ui-state-default ui-corner-all" onclick="window.open('/');">View Site</button>
</div>

<h1>Edit Page</h1>

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
	
	<cfif structKeyExists(params, 'parentID')>
	  #startFormTag(route="update_page_path", parentID=params.parentID, key=params.key, class="form")#
	<cfelse>
	  #startFormTag(route="update_page_path", key=params.key, class="form")#
	    #hiddenField(objectName="page", property="parentID")#
	</cfif>
				
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
	  </cfoutput>
	  <div id="tabs">
	    <!--- navigation for tabs --->
	    <ul>
	      <cfoutput query="pageParts">
	        <li>
	          <a href="##tabs-#name#">#name#</a> <span class="ui-icon ui-icon-close">Remove Tab</span>
	        </li>
	      </cfoutput>
			</ul>
			
			<!--- tab containers --->
			<cfoutput query="pageParts">
	        <div id="tabs-#name#">
	          #hiddenFieldTag(name="pagePart[#name#]", value="#name#")#
	          #richTextTag(name="pagePart_#name#[content]", content="#content#", class="rteditor", rows="15", editor="ckeditor", includeJSLibrary="false")#
	        </div>
	    </cfoutput>

		</div>
	 <cfoutput>
		
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
					
	  <p>#submitTag(class="ui-button ui-state-default ui-corner-all", value="Update Page &rarr;")# or #linkTo(text="Cancel", route="pages_path")#</p>
		
	#endFormTag()#
	
	<cfif page.updatedByID is NOT "">
	  #includePartial(partial='/shared/last_update', updatedByID=page.updatedByID, updatedAt=page.updatedAt)#
	</cfif>
	
	<cfif page.publishedAt is NOT "">
	  <p class="gray">
	  	This page was Published on #dateFormat(page.publishedAt, 'long')# at #timeFormat(page.publishedAt, 'short')#
	  </p>
	</cfif>
</cfoutput>
