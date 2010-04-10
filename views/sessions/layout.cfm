<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><cfoutput>#application.admin.title#</cfoutput></title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js" type="text/javascript"></script>
	
	<cfoutput>
	 #stylesheetLinkTag("base, themes/blue/style.css, splash/jquery-ui-1.7.2.custom.css")#
   	 #javascriptIncludeTag("application")#
	</cfoutput>
</head>
<body>
  <div id="container">
    <div id="header">
      <h1><cfoutput>#linkTo(text="#application.admin.title#", route="admin_path")#</cfoutput></h1>
    </div>
        
    <div class="block">
      <div class="content">
        <div class="inner">
          <cfoutput>#contentForLayout()#</cfoutput>
        </div>
      </div>
    </div>

    <cfoutput>#includePartial('/shared/footer')#</cfoutput>

  </div>
</body>
</html>