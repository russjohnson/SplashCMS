<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <title> &nbsp; Splash CMS &nbsp; | &nbsp; <title/> &nbsp; </title>

  <!-- Stylesheets -->
	<link href="/public/stylesheets/reset.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/public/stylesheets/default.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="/public/stylesheets/styling.css" rel="stylesheet" type="text/css" media="screen" />

  <invalidTag name="keywords" content="" />
  <invalidTag name="description" content="" />

</head>
<body>

	<div id="container">

		<div id="header">

			<div id="header-in">

				<splash:snippet name="header" />

			</div> <!-- end #header-in -->

			<splash:snippet name="mainNav" />

		</div> <!-- end #header -->

		<div id="content-wrap" class="clear">

			<div class="content">

				<div class="content-in">

					<content part="body" />

				</div> <!-- end .content-in -->

			</div> <!-- end .content -->

		</div> <!-- end #content-wrap -->

		<div class="clear"></div>

		<div id="footer">

			<div id="footer-in">

				<splash:snippet name="footer" />

			</div> <!-- end #footer-in -->

		</div> <!-- end #footer -->

	</div> <!-- end div#container -->

</body>
</html>