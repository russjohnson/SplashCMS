<cfimport taglib='../../lib/splash/tags' prefix='splash' /><h2>Splash Tags</h2>

SplashTags are used to render content somewhere in pages, layouts and snippets. Here is a list of all current SplashTags and their attributes.

<h3>Title tag</h3>

This tag represents the Title attribute of a page element. If you would like to render the title of the current page in your layout, simply use the following tag:

<pre>
&lt;title /&gt;
</pre>

This will be replaced by the value of the pages title.

<h3>Content tag</h3>

The content tag can be used in layouts to render the contents of a page. In order to render the part of the page that you want, you have to pass it the part attribute.

<pre>
&lt;content part="body"&gt;

&lt;content part="right-sidebar" /&gt;
</pre>

<h3>Snippet tag</h3>

The snippet tag can be used in pages or layouts to output the content of a snippet. Simply pass it the name of the snippet your created in the Snippets section of the admin.

<pre>
&lt;snippet name="header" /&gt;

&lt;snippet name="footer" /&gt;

&lt;snippet name="mainNavigation" /&gt;
</pre>

<h3>Navigation tag</h3>

The navigation tag can be used in snippets, pages or layouts. Any place that you want to build a menu element for your website. Lets look at an example of the tag the builds a menu using an unordered list.

<pre>
&lt;ul id="nav"&gt;
  &lt;navigation urls="Home: /|Features: /features|Download: /download|Contact: /contact" 
     enclosingTag="li" currentState="active" /&gt;
&lt;/ul&gt;
</pre>

The navigation tag takes three attributes, urls, enclosingTag and currentState. The enclosingTag attribute is optional and is used to wrap each navigation item in an html container such as a list item. This makes it easier to style your menus. The currentState attribute is optional and you can pass the name of a css class that you would like applied to the element when the current page is active.

The urls attribute is required and warrants a little more explanation. The format of the urls attributes is basically a list of navigation Titles and Links separated using the "|" (pipe) character in the following format:

<pre>Label: URL | Label 2: URL2 | Label 3: URL3</pre>

Each element consists of the label (the text that is displayed in the menu) and the url (the link you want the element to point to). Currently only single level navigation elements can be built, however, work has already begun on expanding this tag to allow for nested menus based directly off of your pages in the admin.
