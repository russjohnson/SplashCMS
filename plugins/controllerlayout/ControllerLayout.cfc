<cfcomponent mixin="controller">

	<cffunction name="init" access="public">
		<cfset this.version = "0.9.3">
		<cfreturn this />
	</cffunction>

	<cffunction name="layout">
		<cfargument name="layout" required="true" type="string" />
		
		<cfset request.wheels.layout = arguments.layout />
	</cffunction>
	
	<cffunction name="renderPage" returntype="void" access="public" output="false" hint="Renders content to the browser by including the view page for the specified controller and action.">
		<cfargument name="controller" type="string" required="false" default="#variables.params.controller#" hint="Controller to include the view page for">
		<cfargument name="action" type="string" required="false" default="#variables.params.action#" hint="Action to include the view page for">
		<cfargument name="template" type="string" required="false" default="" hint="A specific template to render">
		<cfargument name="layout" type="any" required="false" default="" hint="The layout to wrap the content in">
		<cfargument name="cache" type="any" required="false" default="" hint="Minutes to cache the content for">
		<cfargument name="$showDebugInformation" type="any" required="false" default="#application.wheels.showDebugInformation#">
		<cfscript>
		
			if (not Len(arguments.layout)) {
				// no layout was specified so lets see if we have called layout()
				if (StructKeyExists(request.wheels, "layout")) {
					arguments.layout = request.wheels.layout;
				} else {
					arguments.layout = application.wheels.renderPage.layout;
				}			
			}
			
			core.renderPage(arguments.controller, arguments.action, arguments.template, arguments.layout, arguments.cache, arguments.$showDebugInformation);
		</cfscript>
	</cffunction>

</cfcomponent>