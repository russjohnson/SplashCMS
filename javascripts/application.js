// Return a helper with preserved width of cells
var fixHelper = function(e, ui) {
	ui.children().each(function() {
		$(this).width($(this).width());
	});
	return ui;
};

$(document).ready(function(){
  
  // this adds the nice hover state to all of our buttons    	
	$('.ui-button').hover(function() {
  		$(this).addClass("ui-state-hover");
  	}, function() {
  		$(this).removeClass("ui-state-hover");
	});
	
});