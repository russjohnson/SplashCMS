<cfhtmlhead text='<script type="text/javascript" src="/javascripts/jquery.slug.js"></script>'>

<script type="text/javascript">
$(document).ready(function(){
  // slug function
  $("#page-title").slug({hide: false});
  
  $(".more").hide();
  $("#hideShow").click(function(){
    $(".more").slideToggle(600);
    return false;
  }).hover(function() {
			$(this).addClass("ui-state-hover");
		}, function() {
			$(this).removeClass("ui-state-hover");
	});
  
  // Add markItUp! to your textarea in one line
	// $('textarea').markItUp( { Settings }, { OptionalExtraSettings } );
	$('.text_area').markItUp(mySettings);
  
  
});
</script>

<script type="text/javascript">
	$(function() {
		var $tab_title_input = $('#tab_title');
		var tab_counter = 2;

		// tabs init with a custom tab template and an "add" callback filling in the content
		var $tabs = $('#tabs').tabs({
			tabTemplate: '<li><a href="#tabs-#{label}">#{label}</a> <span class="ui-icon ui-icon-close">Remove Tab</span></li>',
			//panelTemplate: '<div id="tabs-'+$tab_title_input.val()+'"></div>',
			//panelTemplate: '',
			add: function(event, ui) {
				var tab_content = '<input type="hidden" name="pagePart['+$tab_title_input.val()+']" id="pagePart['+$tab_title_input.val()+']" value="'+$tab_title_input.val()+'" /><textarea class="text_area added" rows="15" name="pagePart_'+$tab_title_input.val()+'[content]" id="pagePart_'+$tab_title_input.val()+'[content]"></textarea>'; //$tab_content_input.val() || 'Tab '+tab_counter+' content.';
				$(ui.panel).append(tab_content);
			}
		});

		// modal dialog init: custom buttons and a "close" callback reseting the form inside
		var $dialog = $('#dialog').dialog({
			autoOpen: false,
			modal: true,
			buttons: {
				'Add': function() {
					addTab();
					$(this).dialog('close');
				},
				'Cancel': function() {
					$(this).dialog('close');
				}
			},
			open: function() {
				$tab_title_input.focus();
			},
			close: function() {
				$form[0].reset();
			}
		});

		// addTab form: calls addTab function on submit and closes the dialog
		var $form = $('form',$dialog).submit(function() {
			addTab();
			$dialog.dialog('close');
			return false;
		});

		// actual addTab function: adds new tab using the title input from the form above
		function addTab() {
			var tab_title = $tab_title_input.val() || 'Tab '+tab_counter;
			$tabs.tabs('add', '#tabs-'+tab_title, tab_title);
			tab_counter++;
			// call the markitup editor on the new tab
			$('.added').markItUp(mySettings);
		}

		// addTab button: just opens the dialog
		$('#add_tab').click(function() {
			$dialog.dialog('open');
		}).hover(function() {
			$(this).addClass("ui-state-hover");
		}, function() {
			$(this).removeClass("ui-state-hover");
		});

		// close icon: removing the tab on click
		// note: closable tabs gonna be an option in the future - see http://dev.jqueryui.com/ticket/3924
		$('#tabs span.ui-icon-close').live('click', function() {
			var index = $('li',$tabs).index($(this).parent());
			$tabs.tabs('remove', index);
		});
	});
	</script>

<style type="text/css">
	#dialog label, #dialog input { display:block; }
	#dialog label { margin-top: 0.5em; }
	#dialog input, #dialog textarea { width: 95%; }
	#tabs { margin-top: 1em; }
	#tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
	#add_tab, #hideShow { cursor: pointer; }
</style>

<div class="page-properties">
  <button id="add_tab" class="ui-button ui-state-default ui-corner-all">Add Tab</button> 
  <button id="hideShow" class="ui-button ui-state-default ui-corner-all">Page Properties</button>
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
	          #textAreaTag(name="pagePart_#application.defaults.page.parts[i]#[content]", class="text_area", rows="15")#
	        </div>
	    </cfloop>
			<!---<div id="tabs-1">
			  
  	    #hiddenField(objectName="pagePart", property="name")#
  	    #textArea(objectName="pagePart", property="content", class="text_area", rows="15")#
			</div>--->
		</div>
	 
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
