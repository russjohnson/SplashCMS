<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<style type="text/css">
	#dialog label, #dialog input { display:block; }
	#dialog label { margin-top: 0.5em; }
	#dialog input, #dialog textarea { width: 95%; }
	#tabs { margin-top: 1em; }
	#tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
	#add_tab, #hideShow { cursor: pointer; }
</style>

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
	          #textAreaTag(name="pagePart_#name#[content]", content="#content#", class="text_area", rows="15")#
	        </div>
	    </cfoutput>

		</div>
	 <cfoutput>
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
