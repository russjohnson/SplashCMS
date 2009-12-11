# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.67)
# Database: splash_development
# Generation Time: 2009-09-05 01:15:34 -0400
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `layouts`;

CREATE TABLE `layouts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `content` text,
  `fileName` varchar(35) default NULL,
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdById` int(11) default NULL,
  `updatedById` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` (`id`,`name`,`content`,`fileName`,`createdAt`,`updatedAt`,`createdById`,`updatedById`)
VALUES
	(1,'Normal','<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n\r\n  <title> &nbsp; Splash CMS &nbsp; | &nbsp; <s:title /> &nbsp; </title>\r\n\r\n  <!-- Stylesheets -->\r\n	<link href=\"/public/stylesheets/reset.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n	<link href=\"/public/stylesheets/default.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n	<link href=\"/public/stylesheets/styling.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n\r\n  <meta name=\"keywords\" content=\"\" />\r\n  <meta name=\"description\" content=\"\" />\r\n\r\n</head>\r\n<body>\r\n\r\n	<div id=\"container\">\r\n\r\n		<div id=\"header\">\r\n\r\n			<div id=\"header-in\">\r\n\r\n				<s:snippet name=\"header\">\r\n\r\n			</div> <!-- end #header-in -->\r\n\r\n			<s:snippet name=\"mainNav\" />\r\n\r\n		</div> <!-- end #header -->\r\n\r\n		<div id=\"content-wrap\" class=\"clear\">\r\n\r\n			<div class=\"content\">\r\n\r\n				<div class=\"content-in\">\r\n\r\n					<s:snippet name=\"breadcrumbs\" />\r\n					<s:content part=\"body\" />\r\n\r\n				</div> <!-- end .content-in -->\r\n\r\n			</div> <!-- end .content -->\r\n\r\n		</div> <!-- end #content-wrap -->\r\n\r\n		<div class=\"clear\"></div>\r\n\r\n		<div id=\"footer\">\r\n\r\n			<div id=\"footer-in\">\r\n\r\n				<s:snippet name=\"footer\" />\r\n\r\n			</div> <!-- end #footer-in -->\r\n\r\n		</div> <!-- end #footer -->\r\n\r\n	</div> <!-- end div#container -->\r\n\r\n</body>\r\n</html>','09032009010255392.cfm','2009-07-30 17:59:55','2009-09-03 01:02:55',1,1),
	(2,'CSS Layout','<html>\r\n\r\n</html>',NULL,'2009-08-19 10:11:22',NULL,1,NULL);

/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pageClasses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pageClasses`;

CREATE TABLE `pageClasses` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(35) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `pageClasses` WRITE;
/*!40000 ALTER TABLE `pageClasses` DISABLE KEYS */;
INSERT INTO `pageClasses` (`id`,`name`)
VALUES
	(1,'Content Page'),
	(2,'File Not Found');

/*!40000 ALTER TABLE `pageClasses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pageParts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pageParts`;

CREATE TABLE `pageParts` (
  `id` int(11) NOT NULL auto_increment,
  `pageID` int(11) default NULL,
  `name` varchar(100) default NULL,
  `content` text,
  `fileName` varchar(35) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `pageParts` WRITE;
/*!40000 ALTER TABLE `pageParts` DISABLE KEYS */;
INSERT INTO `pageParts` (`id`,`pageID`,`name`,`content`,`fileName`)
VALUES
	(1,1,'extended',NULL,'09022009081445590.cfm'),
	(2,1,'body','<h2>Home Page</h2>\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.','09022009081445599.cfm'),
	(3,3,'body','<h2>Splash Tags</h2>\r\n\r\nSplashTags are used to render content somewhere in pages, layouts and snippets. Here is a list of all current SplashTags and their attributes.\r\n\r\n<h3>Title tag</h3>\r\n\r\nThis tag represents the Title attribute of a page element. If you would like to render the title of the current page in your layout, simply use the following tag:\r\n\r\n<pre>\r\n&lt;s:title /&gt;\r\n</pre>\r\n\r\nThis will be replaced by the value of the pages title.\r\n\r\n<h3>Content tag</h3>\r\n\r\nThe content tag can be used in layouts to render the contents of a page. In order to render the part of the page that you want, you have to pass it the part attribute.\r\n\r\n<pre>\r\n&lt;s:content part=\"body\"&gt;\r\n\r\n&lt;s:content part=\"right-sidebar\" /&gt;\r\n</pre>\r\n\r\n<h3>Snippet tag</h3>\r\n\r\nThe snippet tag can be used in pages or layouts to output the content of a snippet. Simply pass it the name of the snippet your created in the Snippets section of the admin.\r\n\r\n<pre>\r\n&lt;s:snippet name=\"header\" /&gt;\r\n\r\n&lt;s:snippet name=\"footer\" /&gt;\r\n\r\n&lt;s:snippet name=\"mainNavigation\" /&gt;\r\n</pre>\r\n\r\n<h3>Navigation tag</h3>\r\n\r\nThe navigation tag can be used in snippets, pages or layouts. Any place that you want to build a menu element for your website. Lets look at an example of the tag the builds a menu using an unordered list.\r\n\r\n<pre>\r\n&lt;s:navigation urls=\"Home: /|Features: /features|Download: /download|Contact: /contact\" currentState=\"active\" /&gt;\r\n</pre>\r\n\r\nThe navigation tag takes three attributes, urls, enclosingTag and currentState. The enclosingTag attribute is optional and is used to wrap each navigation item in an html container such as a list item. This makes it easier to style your menus. The currentState attribute is optional and you can pass the name of a css class that you would like applied to the element when the current page is active.\r\n\r\nThe urls attribute is required and warrants a little more explanation. The format of the urls attributes is basically a list of navigation Titles and Links separated using the \"|\" (pipe) character in the following format:\r\n\r\n<pre>Label: URL | Label 2: URL2 | Label 3: URL3</pre>\r\n\r\nEach element consists of the label (the text that is displayed in the menu) and the url (the link you want the element to point to). Currently only single level navigation elements can be built, however, work has already begun on expanding this tag to allow for nested menus based directly off of your pages in the admin.\r\n\r\n','09052009005437537.cfm'),
	(4,5,'body',NULL,'09052009010520875.cfm'),
	(5,2,'body','<h3><s:title /></h3>\r\n\r\n<p>The file you were looking for could not be found.</p>\r\n\r\n\r\n<p>It is possible that you typed the URL incorrectly or that you clicked on a bad link.</p>\r\n\r\n<p><a href=\"/\">Back to home page</a></p>','09052009004426985.cfm'),
	(6,6,'body','<h1>Tags that render output</h1>','09012009232821252.cfm'),
	(7,7,'body','<h1>Conditional Tags</h1>','09012009233025180.cfm'),
	(8,4,'body','<h3><s:title /></h3>','09052009005157737.cfm'),
	(9,8,'body','<h2><s:title /></h2>\r\n\r\n<p><a href=\"http://groups.google.com/group/splashcms\">Google Group</a></p>','09052009010832545.cfm');

/*!40000 ALTER TABLE `pageParts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `slug` varchar(100) default NULL,
  `breadcrumb` varchar(160) default NULL,
  `pageClassID` int(11) default NULL,
  `status` varchar(25) default NULL,
  `parentID` int(11) default NULL,
  `layoutID` int(11) default NULL,
  `description` varchar(255) default NULL,
  `keywords` varchar(255) default NULL,
  `publishedAt` datetime default NULL,
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdByID` int(11) default NULL,
  `updatedByID` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`,`title`,`slug`,`breadcrumb`,`pageClassID`,`status`,`parentID`,`layoutID`,`description`,`keywords`,`publishedAt`,`createdAt`,`updatedAt`,`createdByID`,`updatedByID`)
VALUES
	(1,'Home','/','Home',1,'Published',0,1,'Base Home Page',NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23','2009-09-01 23:22:08',1,1),
	(2,'File Not Found','file-not-found','File Not Found',2,'Published',1,1,NULL,NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23','2009-09-01 23:24:16',1,1),
	(3,'Splash Tags','splash-tags','Splash Tags',1,'Published',1,1,NULL,NULL,'2009-08-13 19:51:51','2009-08-13 19:51:51','2009-08-13 20:12:35',1,1),
	(4,'Features','features',NULL,1,'Published',1,1,NULL,NULL,'2009-09-02 21:13:19','2009-08-19 10:07:04','2009-09-02 21:13:19',1,1),
	(5,'Snippets','snippets',NULL,1,'Draft',4,1,NULL,NULL,'2009-09-02 23:45:50','2009-08-19 10:08:04','2009-09-05 01:05:20',1,1),
	(6,'Tags that render output','tags-that-render-output',NULL,1,'Draft',3,1,NULL,NULL,NULL,'2009-09-01 23:28:21',NULL,1,NULL),
	(7,'Conditional Tags','conditional-tags',NULL,1,'Draft',3,1,NULL,NULL,NULL,'2009-09-01 23:30:25',NULL,1,NULL),
	(8,'Contact','contact',NULL,1,'Published',1,1,NULL,NULL,'2009-09-05 01:07:50','2009-09-05 01:07:50','2009-09-05 01:08:32',1,1);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `snippets`;

CREATE TABLE `snippets` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `content` text,
  `fileName` varchar(35) default NULL,
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdByID` int(11) default NULL,
  `updatedByID` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` (`id`,`name`,`content`,`fileName`,`createdAt`,`updatedAt`,`createdByID`,`updatedByID`)
VALUES
	(2,'Footer','Splash CMS 0.2.5 - Copyright &copy; 2009 Mad Piranha, Inc. All Rights Reserved.','09052009005006608.cfm','2009-07-30 16:59:36','2009-09-05 00:50:06',1,1),
	(1,'Header','<h1>Splash CMS</h1>','09052009004347813.cfm','2009-07-31 11:05:13','2009-09-05 00:43:47',1,1),
	(3,'MainNav','<s:navigation urls=\"Home:/|Features:/features|SplashTags:/splash-tags|Contact:/contact\" id=\"nav\" currentClass=\"active\" />','09022009210000945.cfm','2009-08-07 18:35:09','2009-09-02 21:00:00',1,1),
	(4,'Breadcrumbs','<div>\r\n<s:breadcrumb />\r\n</div>\r\n\r\n','09022009233938413.cfm','2009-09-01 21:34:05','2009-09-02 23:39:38',1,1);

/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) character set latin1 collate latin1_general_ci NOT NULL default '',
  `password` varchar(255) character set latin1 collate latin1_general_ci NOT NULL default '',
  `email` varchar(100) character set latin1 collate latin1_general_ci NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `admin` tinyint(1) default '0',
  `developer` tinyint(1) default '0',
  `lastLogin` datetime default NULL,
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdByID` int(11) default NULL,
  `updatedByID` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`password`,`email`,`name`,`admin`,`developer`,`lastLogin`,`createdAt`,`updatedAt`,`createdByID`,`updatedByID`)
VALUES
	(1,'admin','010039FC01003A1F98B6E4AF6EDF37187DE2E2B2BAADB074DB1DDF1903DA390A31FB4413A3111505011E693158542FD311189D6BC7651AA87D7113336F8A82C9','admin@yoursite.com','Administrator',1,0,'2009-09-05 00:42:35','2009-07-30 14:55:53','2009-09-05 00:42:35',1,1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
