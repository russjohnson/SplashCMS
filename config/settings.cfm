<cfset application.admin.title = "Splash CMS">
<cfset application.admin.disclaimer = "Splash CMS 0.2.5 - Copyright &copy; 2009 Mad Piranha, Inc.">
<cfset application.defaults.page.parts = ['body','extended']>

<!--- PATH SETTINGS --->
<cfset application.defaults.rootPath = "/">
<cfset application.defaults.layoutsPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/layouts">
<cfset application.defaults.snippetsPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/snippets">
<cfset application.defaults.pagesPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/pages">
    

<!--- ADMIN TABS --->
<cfset application.admin.tabs.titles = []>
<cfset application.admin.tabs.routes = []>
    

<!--- EXTENSION SETTINGS --->
<cfset application.extensions = {}>
    
<cfset set(overwritePlugins = false)>