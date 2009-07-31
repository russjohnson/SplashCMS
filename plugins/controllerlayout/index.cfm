<h1>Controller Layouts</h1>

<p>This plugin adds a <code>layout()</code> method so that you can specify the layout one time per Controller. Call the <code>layout()</code> from
	within the controllers <code>init()</code>. If you have a complex application this can save you time since you would no longer need to specify 
	the layout for every action. The <code>layout()</code> can also be called in a base controllers <code>init()</code> so that the layout can easily
	be shared across multiple controllers without it being the default.</p>

<h2>Methods Overridden</h2>
<p>Here is a listing of the methods that were overridden.</p>
<ul>
	<li><strong>renderPage</strong> - render page now checks to see of the layout() method has been called and if so uses that layout instead of the default.
</ul>

<h2>Uninstallation</h2>
<p>To uninstall this plugin simply delete the <tt>/plugins/ControllerLayout-0.2.zip</tt> file.</p>

<h2>Credits</h2>
<p>This plugin was created by <a href="http://iamjamesgibson.com">James Gibson</a>.</p>


<p><a href="<cfoutput>#cgi.http_referer#</cfoutput>">&lt;&lt;&lt; Go Back</a></p>