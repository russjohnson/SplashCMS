USE [SplashCMS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'layouts') DROP TABLE layouts;
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pageClasses') DROP TABLE pageClasses;
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pageParts') DROP TABLE pageParts;
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pages') DROP TABLE pages;
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'snippets') DROP TABLE snippets;
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'users') DROP TABLE users;
GO

CREATE TABLE [dbo].[layouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[content] [text] NULL,
	[filename] [varchar](100) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdById] [int] NULL,
	[updatedById] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE dbo.layouts ADD CONSTRAINT
	PK_layouts PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE TABLE [dbo].[pageClasses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](36) NOT NULL
) ON [PRIMARY]

ALTER TABLE dbo.pageClasses ADD CONSTRAINT
	PK_pageClasses PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE TABLE [dbo].[pageParts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pageID] [int] NULL,
	[name] [varchar](100) NULL,
	[content] [text] NULL,
	[filename] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE dbo.pageParts ADD CONSTRAINT
	PK_pageParts PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE TABLE [dbo].[pages] (
  [id] [int] IDENTITY(1,1) NOT NULL,
  [title] [varchar] (255) NULL,
  [slug] [varchar](100) NULL,
  [breadcrumb] [varchar](160) NULL,
  [pageClassID] [int] NULL,
  [status] [varchar](25) NULL,
  [parentID] [int] NULL,
  [layoutID] [int] NULL,
  [description] [varchar](255) NULL,
  [keywords] [varchar](255) NULL,
  [publishedAt] [datetime] NULL,
  [createdAt] [datetime] NULL,
  [updatedAt] [datetime] NULL,
  [createdByID] [int] NULL,
  [updatedByID] [int] NULL
) ON [PRIMARY]

ALTER TABLE dbo.pages ADD CONSTRAINT
	PK_pages PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE TABLE [dbo].[snippets] (
  [id] [int] IDENTITY(1,1) NOT NULL,
  [name] [varchar](100)  NULL,
  [content] [text] NULL,
  [fileName] [varchar](100)  NULL,
  [createdAt] [datetime]  NULL,
  [updatedAt] [datetime]  NULL,
  [createdByID] [int]  NULL,
  [updatedByID] [int]  NULL
) ON [PRIMARY]

ALTER TABLE dbo.snippets ADD CONSTRAINT
	PK_snippets PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[admin] [tinyint] NOT NULL CONSTRAINT [DF_users_admin]  DEFAULT ((0)),
	[developer] [tinyint] NOT NULL CONSTRAINT [DF_users_developer]  DEFAULT ((0)),
	[lastLogin] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdByID] [int] NULL,
	[updatedByID] [int] NULL
) ON [PRIMARY]


ALTER TABLE dbo.users ADD CONSTRAINT
	PK_users PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[layouts] ON
INSERT INTO layouts (id, name,content,fileName,createdAt,updatedAt,createdById,updatedById)
	SELECT 1,'Normal','<html xmlns="http://www.w3.org/1999/xhtml">'+ CHAR(13) + CHAR(10) + '<head>'+ CHAR(13) + CHAR(10) + '<title> &nbsp; Splash CMS &nbsp; | &nbsp; <s:title /> &nbsp; </title>'+ CHAR(13) + CHAR(10) + '<!-- Stylesheets -->'+ CHAR(13) + CHAR(10) + '<link href="/public/stylesheets/reset.css" rel="stylesheet" type="text/css" media="all" />'+ CHAR(13) + CHAR(10) + '<link href="/public/stylesheets/default.css" rel="stylesheet" type="text/css" media="screen" />'+ CHAR(13) + CHAR(10) + '<link href="/public/stylesheets/styling.css" rel="stylesheet" type="text/css" media="screen" />'+ CHAR(13) + CHAR(10) + '<meta name="keywords" content="" />'+ CHAR(13) + CHAR(10) + '<meta name="description" content="" />'+ CHAR(13) + CHAR(10) + '</head>'+ CHAR(13) + CHAR(10) + '<body>'+ CHAR(13) + CHAR(10) + '<div id="container">'+ CHAR(13) + CHAR(10) + '<div id="header">'+ CHAR(13) + CHAR(10) + '<div id="header-in">'+ CHAR(13) + CHAR(10) + '<s:snippet name="header">'+ CHAR(13) + CHAR(10) + '</div> <!-- end #header-in -->'+ CHAR(13) + CHAR(10) + '<s:snippet name="mainNav" />'+ CHAR(13) + CHAR(10) + '</div> <!-- end #header -->'+ CHAR(13) + CHAR(10) + '<div id="content-wrap" class="clear">'+ CHAR(13) + CHAR(10) + '<div class="content">'+ CHAR(13) + CHAR(10) + '<div class="content-in">'+ CHAR(13) + CHAR(10) + '<s:snippet name="breadcrumbs" />'+ CHAR(13) + CHAR(10) + '<s:content part="body" />'+ CHAR(13) + CHAR(10) + '</div> <!-- end .content-in -->'+ CHAR(13) + CHAR(10) + '</div> <!-- end .content -->'+ CHAR(13) + CHAR(10) + '</div> <!-- end #content-wrap -->'+ CHAR(13) + CHAR(10) + '<div class="clear"></div>'+ CHAR(13) + CHAR(10) + '<div id="footer">'+ CHAR(13) + CHAR(10) + '<div id="footer-in">'+ CHAR(13) + CHAR(10) + '<s:snippet name="footer" />'+ CHAR(13) + CHAR(10) + '</div> <!-- end #footer-in -->'+ CHAR(13) + CHAR(10) + '</div> <!-- end #footer -->'+ CHAR(13) + CHAR(10) + '</div> <!-- end div#container -->'+ CHAR(13) + CHAR(10) + '</body>'+ CHAR(13) + CHAR(10) + '</html>','09032009010255392.cfm',getdate(),getdate(),1,1
	UNION ALL
	SELECT 2,'CSS Layout','<html>'+ CHAR(13) + CHAR(10) + '</html>',NULL,getdate(),getdate(),1,1
SET IDENTITY_INSERT [dbo].[layouts] OFF
GO

SET IDENTITY_INSERT [dbo].[pageClasses] ON
INSERT INTO pageClasses (id,name) 
	SELECT 1,'Content Page'
	UNION ALL	
	SELECT 2,'File Not Found'
SET IDENTITY_INSERT [dbo].[pageClasses] OFF
GO

SET IDENTITY_INSERT [dbo].[pageParts] ON
INSERT INTO pageParts (id,pageID,name,content,fileName)
SELECT 1,1,'extended',NULL,'09022009081445590.cfm'
UNION ALL
SELECT 2,1,'body','<h2>Home Page</h2>'+ CHAR(13) + CHAR(10) + 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.','09022009081445599.cfm'
UNION ALL
SELECT 3,3,'body','<h2>Splash Tags</h2>'+ CHAR(13) + CHAR(10) + 'SplashTags are used to render content somewhere in pages, layouts and snippets. Here is a list of all current SplashTags and their attributes.'+ CHAR(13) + CHAR(10) + '<h3>Title tag</h3>'+ CHAR(13) + CHAR(10) + 'This tag represents the Title attribute of a page element. If you would like to render the title of the current page in your layout, simply use the following tag:'+ CHAR(13) + CHAR(10) + '<pre>'+ CHAR(13) + CHAR(10) + '&lt;s:title /&gt;'+ CHAR(13) + CHAR(10) + '</pre>'+ CHAR(13) + CHAR(10) + 'This will be replaced by the value of the pages title.'+ CHAR(13) + CHAR(10) + '<h3>Content tag</h3>'+ CHAR(13) + CHAR(10) + 'The content tag can be used in layouts to render the contents of a page. In order to render the part of the page that you want, you have to pass it the part attribute.'+ CHAR(13) + CHAR(10) + '<pre>'+ CHAR(13) + CHAR(10) + '&lt;s:content part="body"&gt;'+ CHAR(13) + CHAR(10) + '&lt;s:content part="right-sidebar" /&gt;'+ CHAR(13) + CHAR(10) + '</pre>'+ CHAR(13) + CHAR(10) + '<h3>Snippet tag</h3>'+ CHAR(13) + CHAR(10) + 'The snippet tag can be used in pages or layouts to output the content of a snippet. Simply pass it the name of the snippet your created in the Snippets section of the admin.'+ CHAR(13) + CHAR(10) + '<pre>'+ CHAR(13) + CHAR(10) + '&lt;s:snippet name="header" /&gt;'+ CHAR(13) + CHAR(10) + '&lt;s:snippet name="footer" /&gt;'+ CHAR(13) + CHAR(10) + '&lt;s:snippet name="mainNavigation" /&gt;'+ CHAR(13) + CHAR(10) + '</pre>'+ CHAR(13) + CHAR(10) + '<h3>Navigation tag</h3>'+ CHAR(13) + CHAR(10) + 'The navigation tag can be used in snippets, pages or layouts. Any place that you want to build a menu element for your website. Lets look at an example of the tag the builds a menu using an unordered list.'+ CHAR(13) + CHAR(10) + '<pre>'+ CHAR(13) + CHAR(10) + '&lt;s:navigation urls="Home: /|Features: /features|Download: /download|Contact: /contact" currentState="active" /&gt;'+ CHAR(13) + CHAR(10) + '</pre>'+ CHAR(13) + CHAR(10) + 'The navigation tag takes three attributes, urls, enclosingTag and currentState. The enclosingTag attribute is optional and is used to wrap each navigation item in an html container such as a list item. This makes it easier to style your menus. The currentState attribute is optional and you can pass the name of a css class that you would like applied to the element when the current page is active.'+ CHAR(13) + CHAR(10) + 'The urls attribute is required and warrants a little more explanation. The format of the urls attributes is basically a list of navigation Titles and Links separated using the "|" (pipe) character in the following format:'+ CHAR(13) + CHAR(10) + '<pre>Label: URL | Label 2: URL2 | Label 3: URL3</pre>'+ CHAR(13) + CHAR(10) + 'Each element consists of the label (the text that is displayed in the menu) and the url (the link you want the element to point to). Currently only single level navigation elements can be built, however, work has already begun on expanding this tag to allow for nested menus based directly off of your pages in the admin.'+ CHAR(13) + CHAR(10) + '','09052009005437537.cfm'
UNION ALL
SELECT 4,5,'body',NULL,'09052009010520875.cfm'
UNION ALL
SELECT 5,2,'body','<h3><s:title /></h3>'+ CHAR(13) + CHAR(10) + '<p>The file you were looking for could not be found.</p>'+ CHAR(13) + CHAR(10) + ''+ CHAR(13) + CHAR(10) + '<p>It is possible that you typed the URL incorrectly or that you clicked on a bad link.</p>'+ CHAR(13) + CHAR(10) + '<p><a href="/">Back to home page</a></p>','09052009004426985.cfm'
UNION ALL
SELECT 6,6,'body','<h1>Tags that render output</h1>','09012009232821252.cfm'
UNION ALL
SELECT 7,7,'body','<h1>Conditional Tags</h1>','09012009233025180.cfm'
UNION ALL
SELECT 8,4,'body','<h3><s:title /></h3>','09052009005157737.cfm'
UNION ALL
SELECT 9,8,'body','<h2><s:title /></h2>'+ CHAR(13) + CHAR(10) + '<p><a href="http://groups.google.com/group/splashcms">Google Group</a></p>','09052009010832545.cfm'
SET IDENTITY_INSERT [dbo].[pageParts] OFF
GO

SET IDENTITY_INSERT [dbo].[pages] ON
INSERT INTO pages (id,title,slug,breadcrumb,pageClassID,status,parentID,layoutID,description,keywords,publishedAt,createdAt,updatedAt,createdByID,updatedByID)
SELECT 1,'Home','/','Home',1,'Published',0,1,'Base Home Page',NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 2,'File Not Found','file-not-found','File Not Found',2,'Published',1,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 3,'Splash Tags','splash-tags','Splash Tags',1,'Published',1,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 4,'Features','features',NULL,1,'Published',1,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 5,'Snippets','snippets',NULL,1,'Draft',4,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 6,'Tags that render output','tags-that-render-output',NULL,1,'Draft',3,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 7,'Conditional Tags','conditional-tags',NULL,1,'Draft',3,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
UNION ALL
SELECT 8,'Contact','contact',NULL,1,'Published',1,1,NULL,NULL,getdate(),getdate(),getdate(),1,1
SET IDENTITY_INSERT [dbo].[pages] OFF
GO

SET IDENTITY_INSERT [dbo].[snippets] ON
INSERT INTO snippets (id,name,content,fileName,createdAt,updatedAt,createdByID,updatedByID)
SELECT 2,'Footer','Splash CMS 0.2.5 - Copyright &copy; 2009 Mad Piranha, Inc. All Rights Reserved.','09052009005006608.cfm',getdate(),getDate(),1,1
UNION ALL
SELECT 1,'Header','<h1>Splash CMS</h1>','09052009004347813.cfm',getdate(),getDate(),1,1
UNION ALL
SELECT 3,'MainNav','<s:navigation urls="Home:/|Features:/features|SplashTags:/splash-tags|Contact:/contact" id="nav" currentClass="active" />','09022009210000945.cfm',getdate(),getDate(),1,1
UNION ALL
SELECT 4,'Breadcrumbs','<div>'+ CHAR(13) + CHAR(10) + '<s:breadcrumb />'+ CHAR(13) + CHAR(10) + '</div>'+ CHAR(13) + CHAR(10) ,'09022009233938413.cfm',getdate(),getDate(),1,1
SET IDENTITY_INSERT [dbo].[snippets] OFF

GO

SET IDENTITY_INSERT [dbo].[users] ON
INSERT INTO users (id,username,password,email,name,admin,developer,lastLogin,createdAt,updatedAt,createdByID,updatedByID)
VALUES
	(1,'admin','010039FC01003A1F98B6E4AF6EDF37187DE2E2B2BAADB074DB1DDF1903DA390A31FB4413A3111505011E693158542FD311189D6BC7651AA87D7113336F8A82C9','admin@yoursite.com','Administrator',1,0,NULL,getdate(),getDate(),1,1);
SET IDENTITY_INSERT [dbo].[users] ON

GO

SET ANSI_PADDING OFF