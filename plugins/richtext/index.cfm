<h1>Rich Text Form Helpers</h1>

<p>This plugin will add 2 new form helpers that will display a Rich Text Editor and still use the built-in Wheels validations on it.</p>

<p>Currently only the Mark-it-up editor and ckEditor are supported and both require jQuery.</p>

<h2>Instructions</h2>

<ul>
	<li>First, make sure you have the default "files" folder created in the root of your wheels application.</li>
	<li>Next, copy the folder for the editor you want to use from the plugins/richtext/editors directory into the /files/plugins/richtext directory under the root of your Wheels application.</li>
</ul>

<p>
    You should end up with the following:
<pre>
/files/plugins/richtext/nameofeditor
</pre>
</p>

<h2>Syntax</h2>

<p>The RTE form helpers take the same arguments as textArea and textAreaTag helpers with a few additions. The richTextField() helper is the same as the textArea() helper and requires the objectName and property attributes. The richTextTag() helper is the same as the textAreaTag() helper.</p>

<p>
<pre>
#richTextField(objectName='snippet', property='content', rows="15", editor="markitup", includeJSLibrary="false")#
        
#richTextTag(name="content", rows="15", editor="markitup", includeJSLibrary="false")#
</pre>
</p>

<p>A couple things to note. The "editor" argument tells the method which style of editor to use. The includeJSLibrary argument is used to tell the method wether or not it should include the base javascript library file required by the editor. It defaults to TRUE and in the case of Mark-It-Up it will include a call to the jquery library in the HTML HEAD section. If you are already including jquery in your application for other functionality, just set this to FALSE.</p>

<p>The editor attribute can be either 'markitup' or 'ckeditor'</p>

<p>If using ckEditor, you can pass an addition attribute called 'options' which gets passed into the the editor for configuration. For instance, you can define your own toolbar according the ckEditor docs and then pass those options in as a string.</p>


