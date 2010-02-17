$(document).ready(function(){
  
  // Add markItUp! to our textarea
	$('.text_area').markItUp(mySettings);
  
});

$(function() {
		
		var name = $("#category-name"),
			allFields = $([]).add(name),
			tips = $("#validateTips");

		function updateTips(t) {
			tips.text(t).effect("highlight",{},1500);
		}

		function checkLength(o,n,min,max) {

			if ( o.val().length > max || o.val().length < min ) {
				o.addClass('ui-state-error');
				updateTips("Length of " + n + " must be between "+min+" and "+max+".");
				return false;
			} else {
				return true;
			}

		}

		function checkRegexp(o,regexp,n) {

			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass('ui-state-error');
				updateTips(n);
				return false;
			} else {
				return true;
			}

		}
		
		$("#dialog").dialog({
			autoOpen: false,
			height: 200,
			modal: true,
			buttons: {
				'Create Category': function() {
					var bValid = true;
					allFields.removeClass('ui-state-error');

					bValid = bValid && checkLength(name,"category-name",3,50);

					bValid = bValid && checkRegexp(name,/^[a-z]([0-9a-z_])+$/i,"The category name may consist of a-z, 0-9, underscores, begin with a letter.");
					
					// here we need to add the category to the select list					
					if (bValid) {
						var dataString = 'name=' + name.val();;
						//alert (dataString);return false; 
						$.ajax({ 
						  type: 'post', 
						  url: '/admin/categories/create',
						  data: dataString,
						  success: function(data, textStatus){
						    $("#categoryid").append(data);
						    $("#categoryid option:last").attr("selected", "selected");
						  }, 
						  error: function(XMLHttpRequest, textStatus, errorThrown){
						    alert('There was an error adding your category.');
						  }
						}); 
						$(this).dialog('close');
						return false;
					}
				},
				Cancel: function() {
					$(this).dialog('close');
				}
			},
		  open: function() {
  			$('#category-name').focus();
  		},
			close: function() {
				allFields.val('').removeClass('ui-state-error');
			}
		});
		
		
		$('#add-new').click(function() {
			$('#dialog').dialog('open');
		})
		.hover(
			function(){ 
				$(this).addClass("ui-state-hover"); 
			},
			function(){ 
				$(this).removeClass("ui-state-hover"); 
			}
		).mousedown(function(){
			$(this).addClass("ui-state-active"); 
		})
		.mouseup(function(){
				$(this).removeClass("ui-state-active");
		});

	});