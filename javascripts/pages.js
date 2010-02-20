
$(document).ready(function(){
  // slug function
  $("#page-title").slug({hide: false});
  
  // Add markItUp! to our textarea
	//$('.text_area').markItUp(mySettings);
  
  
});

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
	
	// hideShow button: hides and shows the page meta-data
	$(".more").hide();
  $("#hideShow").click(function(){
    $(".more").slideToggle(600);
    return false;
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