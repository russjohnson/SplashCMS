<cfcomponent extends="plugins.dbmigrate.Migration" hint="enter default data">
  <cffunction name="up">
    <cfscript>
    // add the admin user record
    addRecord(table="users", username="admin", email="admin@yoursite.com", name="Administrator", admin=1, password="010039FC01003A1F98B6E4AF6EDF37187DE2E2B2BAADB074DB1DDF1903DA390A31FB4413A3111505011E693158542FD311189D6BC7651AA87D7113336F8A82C9");
    
    // add the default layout file
    addRecord(table="layouts", name="Normal", filename="#createUUID()#", content='<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n\r\n  <title> &nbsp; Splash CMS &nbsp; | &nbsp; <s:title /> &nbsp; </title>\r\n\r\n  <!-- Stylesheets -->\r\n	<link href=\"/public/stylesheets/reset.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n	<link href=\"/public/stylesheets/default.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n	<link href=\"/public/stylesheets/styling.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n\r\n  <s:keywords />\r\n  <s:description />\r\n\r\n</head>\r\n<body>\r\n\r\n	<div id=\"container\">\r\n\r\n		<div id=\"header\">\r\n\r\n			<div id=\"header-in\">\r\n\r\n				<s:snippet name=\"header\" />\r\n\r\n			</div> <!-- end #header-in -->\r\n\r\n		</div> <!-- end #header -->\r\n\r\n		<div id=\"content-wrap\" class=\"clear\">\r\n\r\n			<div class=\"content\">\r\n\r\n				<div class=\"content-in\">\r\n\r\n					<s:content part=\"body\" />\r\n\r\n				</div> <!-- end .content-in -->\r\n\r\n			</div> <!-- end .content -->\r\n\r\n		</div> <!-- end #content-wrap -->\r\n\r\n		<div class=\"clear\"></div>\r\n\r\n		<div id=\"footer\">\r\n\r\n			<div id=\"footer-in\">\r\n\r\n				<s:snippet name="\footer\" />\r\n\r\n			</div> <!-- end #footer-in -->\r\n\r\n		</div> <!-- end #footer -->\r\n\r\n	</div> <!-- end div#container -->\r\n\r\n</body>\r\n</html>', createdByID="1");

    // add the default page classes
    addRecord(table="pageclasses", name="Content Page");
    addRecord(table="pageclasses", name="File Not Found");
    
    // add the default pages
    addRecord(table="pages", title="Home", slug="/", breadcrumb="Home", pageclassid="1", status="Published", parentid="0", layoutid="1", description="Base Home Page", publishedat="#now()#", createdbyid="1");
    addRecord(table="pages", title="File Not Found", slug="/file-not-found", breadcrumb="File Not Found", pageclassid="2", status="Published", parentid="1", layoutid="1", description="File Not Found", publishedat="#now()#", createdbyid="1");
    
    // add the default page parts
    addRecord(table="pageparts", pageid="1", name="body", content='<h2>Home Page</h2>\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.');
    addRecord(table="pageparts", pageid="1", name="extended", content="");
    addRecord(table="pageparts", pageid="2", name="body", content='<h3><title /></h3>\r\n\r\n<p>The file you were looking for could not be found.</p>\r\n\r\n\r\n<p>It is possible that you typed the URL incorrectly or that you clicked on a bad link.</p>\r\n\r\n<p><a href=\"/\">Back to home page</a></p>');
    
    // add the default snippets
    addRecord(table="snippets", name="Footer", content='Splash CMS 0.2.5 - Copyright &copy; 2009 Mad Piranha, Inc. All Rights Reserved.', createdbyid="1");
    addRecord(table="snippets", name="Header", content='<h1>Splash CMS</h1>', createdbyid="1");
    addRecord(table="snippets", name="MainNav", content='<ul class=\"lavaLampNoImage\" id=\"nav\">\r\n<s:navigation urls=\"Home: /|Features: /features|Tour: /tour|Download: /download|Contact: /contact\" enclosingTag=\"li\" />\r\n</ul>', createdbyid="1");
    
    
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>
