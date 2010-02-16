<cfsetting enablecfoutputonly="true">

<!--- Existence of url.plugin means that the user wants to auto-install the plugin of that ID --->
<cfif StructKeyExists(url, "plugin")>
	<cfset application.wheels.plugins.pluginManager.installPlugin(ListFirst(url.plugin, ","), ListLast(url.plugin, ","))>
</cfif>

<!--- Get latest list of plugins --->
<cfset plugins = application.wheels.plugins.pluginManager.getAvailablePlugins()>

<cfoutput>

<cfinclude template="css.cfm">

<h1>PluginManager</h1>
<p>With the PluginManager, you can download and install all authorized plugins available from the <a href="http://cfwheels.org/plugins">Wheels&nbsp;Plugin&nbsp;Directory</a>. The &quot;Auto Install&quot; links below will automatically download the plugin to this Wheels install and reload your application.</p>

<!--- List installed plugins --->
<h2>Installed Plugins</h2>
<cfloop array="#plugins#" index="plugin">
	<cfif ListFindNoCase(pluginNames(), plugin.name.XmlText)>
		<div class="plugin">
			<h3>
				<a href="#plugin.info_url.XmlText#">#plugin.title.XmlText#</a>
				<cfif 
					StructKeyExists(application.wheels.plugins, plugin.name.XmlText)
					and application.wheels.plugins[plugin.name.XmlText].pluginVersion neq plugin.version.XmlText
				>
					<small>Version #application.wheels.plugins[plugin.name.XmlText].pluginVersion#</small>
				<cfelse>
					<small>Version #plugin.version.XmlText#</small>
				</cfif>
			</h3>
			<p>#plugin.summary.XmlText#</p>
			<ul style="margin-left: 0;">
				<!--- Display upgrade link if newer version available --->
				<cfif
					StructKeyExists(application.wheels.plugins, plugin.name.XmlText)
					and application.wheels.plugins[plugin.name.XmlText].pluginVersion neq plugin.version.XmlText
				>
					<li class="first">
						<strong class="highlighter">Version #plugin.version.XmlText# Available:</strong>
					</li>
					<li>
						<a href="#plugin.info_url.XmlText#">More Info</a>
					</li>
					<li>
						<a href="#cgi.script_name#?#HtmlEditFormat(cgi.query_string)#&amp;plugin=#plugin.id.XmlText#,#Replace(plugin.filename.XmlText, ".zip", "")#">Auto Upgrade</a>
					</li>
					<li>
						<a href="#plugin.download_url.XmlText#">Download</a>
					</li>
				<cfelse>
					<li class="first">
						<a href="#plugin.info_url.XmlText#">More Info</a>
					</li>
				</cfif>
			</ul>
		</div>
	</cfif>
</cfloop>

<!--- List plugins not installed --->
<h2>Available Plugins</h2>
<cfloop array="#plugins#" index="plugin">
	<cfif not ListFindNoCase(pluginNames(), plugin.name.XmlText)>
		<div class="plugin">
			<h3><a href="#plugin.info_url.XmlText#">#plugin.title.XmlText#</a> <small>Version #plugin.version.XmlText#</small></h3>
			<p>#plugin.summary.XmlText#</p>
			<ul style="margin-left: 0;">
				<li class="first">
					<a href="#plugin.info_url.XmlText#">More Info</a>
				</li>
				<li>
					<a href="#cgi.script_name#?#HtmlEditFormat(cgi.query_string)#&amp;plugin=#plugin.id.XmlText#,#Replace(plugin.filename.XmlText, ".zip", "")#">Auto Install</a></li>
				<li>
					<a href="#plugin.download_url.XmlText#">Download</a>
				</li>
			</ul>
		</div>
	</cfif>
</cfloop>

</cfoutput>

<cfsetting enablecfoutputonly="false">