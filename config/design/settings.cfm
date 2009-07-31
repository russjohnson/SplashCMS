<!---
	This file is used to configure specific settings for the "design" environment.
	A variable set in this file will override the one in "config/settings.cfm".
	Example: <cfset set(dataSourceName="devDB")>
--->

<cfset set(overwritePlugins = true)>

<cfset set(URLRewriting="On")>
<cfset set(dataSourceName="chronos")>
  
<cfset set(functionName="sendEmail", server="", username="", password="")>
