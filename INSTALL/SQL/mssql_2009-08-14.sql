/*
* LAYOUTS
*/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[layouts]') AND type in (N'U'))
DROP TABLE [dbo].[layouts]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[layouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[content] [text] NULL,
	[fileName] [varchar](35) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdById] [int] NULL,
	[updatedById] [int] NULL,
 CONSTRAINT [PK_layouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET IDENTITY_INSERT layouts ON

INSERT INTO layouts (id, name, [content], createdAt, updatedAt, createdById, updatedById)
VALUES(1,'Normal','<html xmlns="http://www.w3.org/1999/xhtml"><head>  <title> &nbsp; Splash CMS &nbsp; | &nbsp; <title/> &nbsp; </title>  <!-- Stylesheets -->	<link href="/public/stylesheets/reset.css" rel="stylesheet" type="text/css" media="all" />	<link href="/public/stylesheets/default.css" rel="stylesheet" type="text/css" media="screen" />	<link href="/public/stylesheets/styling.css" rel="stylesheet" type="text/css" media="screen" />  </head><body>	<div id="container">		<div id="header">			<div id="header-in">				<snippet name="header" />			</div> <!-- end #header-in -->		</div> <!-- end #header -->		<div id="content-wrap" class="clear">			<div class="content">				<div class="content-in">					<content part="body" />				</div> <!-- end .content-in -->			</div> <!-- end .content -->		</div> <!-- end #content-wrap -->		<div class="clear"></div>		<div id="footer">			<div id="footer-in">				<snippet name="footer" />			</div> <!-- end #footer-in -->		</div> <!-- end #footer -->	</div> <!-- end div#container --></body></html>','2009-07-30 17:59:55',NULL,1,NULL);

SET IDENTITY_INSERT layouts OFF

SET ANSI_PADDING OFF
GO

/*
* LAYOUTS
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageClasses]') AND type in (N'U'))
DROP TABLE [dbo].[pageClasses]
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[pageClasses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](35) NULL,
 CONSTRAINT [PK_pageClasses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT pageClasses ON

INSERT INTO pageClasses (id, name)
VALUES (1,'Content Page'), (2,'File Not Found')

SET IDENTITY_INSERT pageClasses OFF

SET ANSI_PADDING OFF
GO

/*
* PAGE PARTS
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pageParts]') AND type in (N'U'))
DROP TABLE [dbo].[pageParts]
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[pageParts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pageId] [int] NULL,
	[name] [varchar](100) NULL,
	[content] [text] NULL,
	[fileName] [varchar](35) NULL,
 CONSTRAINT [PK_pageParts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET IDENTITY_INSERT pageParts ON

INSERT INTO pageParts (id, pageId, name, [content])
VALUES (5,1,'body','<h2>Home Page</h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.'),
	(4,1,'extended',NULL),
	(7,2,'body','<h3><title /></h3><p>The file you were looking for could not be found.</p><p>It is possible that you typed the URL incorrectly or that you clicked on a bad link.</p><p><a href="/">Back to home page</a></p>')

SET IDENTITY_INSERT pageParts OFF

SET ANSI_PADDING OFF
GO

/*
* PAGES
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pages]') AND type in (N'U'))
DROP TABLE [dbo].[pages]
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[pages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[slug] [varchar](100) NULL,
	[breadcrumb] [varchar](160) NULL,
	[pageClassId] [int] NULL,
	[status] [varchar](25) NULL,
	[parentId] [int] NULL,
	[layoutId] [int] NULL,
	[description] [varchar](255) NULL,
	[keywords] [varchar](255) NULL,
	[publishedAt] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdById] [int] NULL,
	[updatedById] [int] NULL,
 CONSTRAINT [PK_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT pages ON

INSERT INTO pages (id,title,slug,breadcrumb,pageClassID,[status],parentID,layoutID,[description],keywords,publishedAt,createdAt,updatedAt,createdByID,updatedByID)
VALUES
	(1,'Home','/','Home',1,'Published',0,1,'Base Home Page',NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23',NULL,1,NULL),
	(2,'File Not Found','file-not-found','File Not Found',2,'Published',1,1,NULL,NULL,'2009-08-12 01:18:23','2009-08-12 01:18:23',NULL,1,NULL)

SET IDENTITY_INSERT pages OFF

SET ANSI_PADDING OFF
GO

/*
* SNIPPETS
*/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[snippets]') AND type in (N'U'))
DROP TABLE [dbo].[snippets]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[snippets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[content] [text] NULL,
	[fileName] [varchar](35) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdById] [int] NULL,
	[updatedById] [int] NULL,
 CONSTRAINT [PK_snippets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT snippets ON

INSERT INTO snippets (id,name,[content],createdAt,updatedAt,createdByID,updatedByID)
VALUES
	(2,'Footer','Splash CMS 0.1.0 - Copyright &copy; 2009 Mad Piranha, Inc. All Rights Reserved.','2009-07-30 16:59:36',NULL,1,NULL),
	(1,'Header','<h1>Splash CMS</h1>','2009-07-31 11:05:13',NULL,1,NULL),
	(3,'MainNav','<ul class="lavaLampNoImage" id="nav"><navigation urls="Home: /|Features: /features|Tour: /tour|Download: /download|Contact: /contact" enclosingTag="li" /></ul>','2009-08-07 18:35:09',NULL,1,NULL)

SET IDENTITY_INSERT snippets OFF

GO

/*
* USERS
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](100) NULL,
	[name] [varchar](100) NULL,
	[admin] [tinyint] NULL,
	[developer] [tinyint] NULL,
	[lastLogin] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[createdById] [int] NULL,
	[updatedById] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT users ON

INSERT INTO users (id,username,[password],email,name,[admin],developer,lastLogin,createdAt,updatedAt,createdByID,updatedByID)
VALUES
	(1,'admin','010039FC01003A1F98B6E4AF6EDF37187DE2E2B2BAADB074DB1DDF1903DA390A31FB4413A3111505011E693158542FD311189D6BC7651AA87D7113336F8A82C9','admin@yoursite.com','Administrator',1,0,'2009-08-13 02:50:14','2009-07-30 14:55:53',NULL,1,NULL);

SET IDENTITY_INSERT users OFF

SET ANSI_PADDING OFF
GO