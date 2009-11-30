<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>
	 <cfoutput>#application.admin.title#</cfoutput>
	</title>
	<cfoutput>
	 #stylesheetLinkTag("base, jquery.treeTable.css, themes/blue/style.css, splash//jquery-ui-1.7.2.custom.css")#
	 #javascriptIncludeTag("jquery-1.3.2.min.js, jquery-ui-1.7.2.custom.min.js, jquery.TreeTable.min.js")#
	</cfoutput>
  
  <cfif params.controller is "pages" and (params.action is "new" or params.action is "edit")>
    <cfoutput>#javascriptIncludeTag("pages")#</cfoutput>
  </cfif>
  
  <!---
    TODO Needs to be conditional upon controller/action
  --->
  <cfoutput>
    #javascriptIncludeTag("markitup/jquery.markitup.pack.js, markitup/sets/html/set.js")#
  </cfoutput>
 
 <!---
  TODO need to figure out a way to either move these to the stylesheets folder or make the path relevant
 --->
  <link rel="stylesheet" type="text/css" href="/javascripts/markitup/skins/simple/style.css" />
  <link rel="stylesheet" type="text/css" href="/javascripts/markitup/sets/html/style.css" />
  
  <script type="text/javascript">
    $(document).ready(function(){
      
      // this adds the nice hover state to all of our buttons    	
    	$('.ui-button').hover(function() {
      		$(this).addClass("ui-state-hover");
      	}, function() {
      		$(this).removeClass("ui-state-hover");
    	});
    	
    });
  </script>

</head>
<body>
  <div id="container">
    <div id="header">
      <h1><cfoutput>#linkTo(text=application.admin.title, route="admin_path")#</cfoutput></h1>
      
      <cfoutput>
        #includePartial('/shared/user_navigation')#
        #includePartial('/shared/main_navigation')#
      </cfoutput>
      
    </div>
    <div id="wrapper">
      <div id="main">
        
        <div class="block">
          <cfoutput>
            <!--- secondary navigation will go here if we ever need it --->
            #includePartial("/shared/render_flash")#
          </cfoutput>
          <div class="content">
            <div class="inner">
              <cfoutput>#contentForLayout()#</cfoutput>
            </div>
          </div>
        </div>

        <cfoutput>#includePartial('/shared/footer')#</cfoutput>
      </div>
    </div>
  </div>
</body>
</html>