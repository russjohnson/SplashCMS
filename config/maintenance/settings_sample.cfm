<!---
	This file is used to configure specific settings for the "maintenance" environment.
	A variable set in this file will override the one in "config/settings.cfm".
	Example: <cfset set(ipExceptions="an.ip.num.ber")>
--->

<!--- Datasource Setting --->
<cfset set(dataSourceName="splashcms")>

<!--- URL Rewriting Setting --->
<cfset set(URLRewriting="On")>

<!--- Email Server Settings --->
<cfset set(functionName="sendEmail", server="", username="", password="")>