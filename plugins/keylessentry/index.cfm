<h1>Keyless Entry</h1>

<p>This plugin will generate common user authentication code for your CFWheels application.</p>

<h2>Current Features</h2>

<ul>
  <li>Generates basic controllers, models and views to get up and running quickly.</li>
  <li>Provides basic user authentication.</li>
  <li>Provides a sign-up form to allow new user creation.</li>
  <li>Adds methods to your Wheels app to set as filters to require login.</li>
  <li>Uses email validation prior to activation via email.</li>
</ul>

<cfif structKeyExists(URL, 'generateCode')>
  
  <h2>Creating Files...</h2>
  
  <cfoutput>
  	<p><tt>#generateAuthCode()#</tt></p>
  </cfoutput>
  
  <h2>Next Steps</h2>
  
  <p>
    Next, open your routes file and add the following named routes:
    <br/>
    
    <tt>
      &lt;cfset addRoute(name="login", pattern="login", controller="sessions", action="new")&gt;<br/>
      &lt;cfset addRoute(name="logout", pattern="logout", controller="sessions", action="destroy")&gt;<br/>
      &lt;cfset addRoute(name="signup", pattern="signup", controller="users", action="new")&gt;<br/>
      &lt;cfset addRoute(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")&gt;<br/>
    </tt>
  </p>
  
  <p>
    After that, open the Settings.cfm file for your environment and add your mail server settings:<br/>
    
    <tt>
      &lt;cfset set(functionName="sendEmail", server="", username="", password="")&gt;
    </tt>
  </p>
  
  <p>
    Then, login to your database and create the appropriate tables using the code below:
    
    <h3>MySQL</h3>
    <tt>
      CREATE TABLE `users` (<br/>
      `id` int(11) NOT NULL auto_increment,<br/>
      `username` varchar(20) character set latin1 collate latin1_general_ci NOT NULL default '',<br/>
      `password` varchar(255) character set latin1 collate latin1_general_ci NOT NULL default '',<br/>
      `email` varchar(100) character set latin1 collate latin1_general_ci NOT NULL default '',<br/>
      `firstName` varchar(50) character set latin1 collate latin1_general_ci NOT NULL default '',<br/>
      `lastName` varchar(50) character set latin1 collate latin1_general_ci default NULL,<br/>
      `isAdmin` tinyint(1) default '0',<br/>
      `lastLogin` datetime default NULL,<br/>
      `activationCode` varchar(35) default NULL,<br/>
      `activatedAt` datetime default NULL,<br/>
      `createdAt` datetime default NULL,<br/>
      `updatedAt` datetime default NULL,<br/>
      PRIMARY KEY  (`id`)<br/>
      ) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1
    </tt>
  </p>
  
  <p>
    Now you can click <a href="<cfoutput>#CGI.script_name#</cfoutput>/signup">here to create an account</a>!
  </p>
  
<cfelse>
  
  <h2>Generate Code</h2>
  
  <!--- Form --->
  <cfform action="#CGI.script_name & '?' & CGI.query_string#">
    
    <input type="hidden" name="generateCode" value="true">
	
  	<p><cfinput type="submit" name="btnSubmit" value="Generate"></p>
	
  </cfform>
  
</cfif>


<a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a>