<!--- get the available templates from the template folder --->
<cfset templates = getTemplates()>

<h1>Scaffold</h1>

<p>This plugin will enable Scaffolding in your application, to use it, follow the instructions below.</p>

<p><tt>Note:</tt> the flash messages aren't displayed in the views unless you either make a bit of logic to display the correct one, or use the "flashMessages()" method to quickly dump your flash messages.</p>

<h2>Instructions</h2>

<ul>
	<li>Create the table in your database following Wheels's table name conventions.</li>
	<li>Insert the table name (in singular case) in the "Object name" input field.</li>
	<li>Select the type of Scaffold to perform.</li>
	<li>Click the "Generate" submit button.</li>
</ul>

<h2>Generate form</h2>

<cfif isDefined("FORM.objectToScaffold") AND isDefined("FORM.typeOfScaffold")>
    
    <cfoutput>
    	<p><tt>#generateScaffold(FORM.objectToScaffold, FORM.typeOfScaffold, FORM.template)#</tt></p>
    </cfoutput>
    
    <p>Create another one?</p>
    
<cfelse>

	<p><tt>Example: If your table is named "users", insert "user" in the form field below.</tt></p>
    
</cfif>

<!--- Form --->
<cfform action="#CGI.script_name & '?' & CGI.query_string#">
	<p><label for="objectToScaffold">Object name</label> <br>
	<cfinput type="text" name="objectToScaffold" required="true"  message="An Object name is required"></p>
	
	<p><label for="typeOfScaffold">Type</label> <br>
	<cfselect name="typeOfScaffold" required="true" message="A Type is required">
		<option value="everything" selected="selected">Model, Views and Controller</option>
		<option value="model_controller" selected="selected">Model and Controller</option>
		<option value="controller">Controller</option>
		<option value="view">View</option>
		<option value="model">Model</option>
	</cfselect>
	</p>
	
	<p>
	    <label for="template">Template</label> <br>
	    <cfselect name="template">
	        <cfoutput query="templates">
	            <cfif type is "DIR">
	                <option value="#name#">#name#</option>
	            </cfif>
	        </cfoutput>
    	</cfselect>
	</p>	
	
	<p><cfinput type="submit" name="btnSubmit" value="Generate"></p>
	
</cfform>

<a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a>