# Sequel Pro dump
# Version 1176
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.0.67)
# Database: splash_development
# Generation Time: 2009-08-12 22:24:54 -0400
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
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdById` int(11) default NULL,
  `updatedById` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` (`id`,`name`,`content`,`createdAt`,`updatedAt`,`createdById`,`updatedById`)
VALUES
	(1,'Normal','<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n\r\n  <title> &nbsp; Splash CMS &nbsp; | &nbsp; <title/> &nbsp; </title>\r\n\r\n  <!-- Stylesheets -->\r\n	<link href=\"/public/stylesheets/reset.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n	<link href=\"/public/stylesheets/default.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n	<link href=\"/public/stylesheets/styling.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\r\n\r\n  <invalidTag name=\"keywords\" content=\"\" />\r\n  <invalidTag name=\"description\" content=\"\" />\r\n\r\n</head>\r\n<body>\r\n\r\n	<div id=\"container\">\r\n\r\n		<div id=\"header\">\r\n\r\n			<div id=\"header-in\">\r\n\r\n				<snippet name=\"header\" />\r\n\r\n			</div> <!-- end #header-in -->\r\n\r\n		</div> <!-- end #header -->\r\n\r\n		<div id=\"content-wrap\" class=\"clear\">\r\n\r\n			<div class=\"content\">\r\n\r\n				<div class=\"content-in\">\r\n\r\n					<content part=\"body\" />\r\n\r\n				</div> <!-- end .content-in -->\r\n\r\n			</div> <!-- end .content -->\r\n\r\n		</div> <!-- end #content-wrap -->\r\n\r\n		<div class=\"clear\"></div>\r\n\r\n		<div id=\"footer\">\r\n\r\n			<div id=\"footer-in\">\r\n\r\n				<snippet name=\"footer\" />\r\n\r\n			</div> <!-- end #footer-in -->\r\n\r\n		</div> <!-- end #footer -->\r\n\r\n	</div> <!-- end div#container -->\r\n\r\n</body>\r\n</html>','2009-07-30 17:59:55',NULL,1,NULL);

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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `pageParts` WRITE;
/*!40000 ALTER TABLE `pageParts` DISABLE KEYS */;
INSERT INTO `pageParts` (`id`,`pageID`,`name`,`content`)
VALUES
	(1,1,'body','h2. Home Page\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.'),
	(2,1,'extended',NULL),
	(3,2,'body','h3. <title />\r\n\r\nThe file you were looking for could not be found.\r\n\r\nIt is possible that you typed the URL incorrectly or that you clicked on a bad link.\r\n\r\n<a href="/">Back to home page</a>');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`,`title`,`slug`,`breadcrumb`,`pageClassID`,`status`,`parentID`,`layoutID`,`description`,`keywords`,`publishedAt`,`createdAt`,`updatedAt`,`createdByID`,`updatedByID`)
VALUES
	(1,'Home','/','Home',1,'Published',0,1,'Base Home Page',NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23',NULL,1,NULL),
	(2,'File Not Found','file-not-found','File Not Found',2,'Published',1,1,NULL,NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23',NULL,1,NULL);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `snippets`;

CREATE TABLE `snippets` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `content` text,
  `createdAt` datetime default NULL,
  `updatedAt` datetime default NULL,
  `createdByID` int(11) default NULL,
  `updatedByID` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` (`id`,`name`,`content`,`createdAt`,`updatedAt`,`createdByID`,`updatedByID`)
VALUES
	(2,'Footer','Splash CMS 0.1.0 - Copyright &copy; 2009 Mad Piranha, Inc. All Rights Reserved.','2009-07-30 16:59:36',NULL,1,NULL),
	(1,'Header','h1. Splash CMS','2009-07-31 11:05:13',NULL,1,NULL),
	(3,'MainNav','<ul class=\"lavaLampNoImage\" id=\"nav\">\r\n<navigation urls=\"Home: /|Features: /features|Tour: /tour|Download: /download|Contact: /contact\" enclosingTag=\"li\" />\r\n</ul>','2009-08-07 18:35:09',NULL,1,NULL);

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
	(1,'admin','010039FC01003A1F98B6E4AF6EDF37187DE2E2B2BAADB074DB1DDF1903DA390A31FB4413A3111505011E693158542FD311189D6BC7651AA87D7113336F8A82C9','admin@yoursite.com','Administrator',1,0,NULL,'2009-07-30 14:55:53',NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
