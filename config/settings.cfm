<cfset application.admin.title = "Splash CMS">
<cfset application.defaults.page.parts = ['body','extended']>

<!--- PATH SETTINGS --->
<cfset application.defaults.rootPath = "/">
<cfset application.defaults.layoutsPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/layouts">
<cfset application.defaults.snippetsPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/snippets">
<cfset application.defaults.pagesPath = getDirectoryFromPath(getBaseTemplatePath()) & "public/pages">