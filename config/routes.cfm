<!--- HOME ROUTE --->
<cfset addRoute(name="home", pattern="", controller="viewer", action="index")>

<!--- LOGIN ROUTES --->
<cfset addRoute(name="login", pattern="/admin/login", controller="sessions", action="new")>
<cfset addRoute(name="logout", pattern="/admin/logout", controller="sessions", action="destroy")>
  
<!--- PAGE ROUTES --->

<cfset addRoute(name="new_page_path", pattern="/admin/pages/[parentID]/child/new", controller="pages", action="new")>
<cfset addRoute(name="pages_path", pattern="/admin/pages", controller="pages", action="index")>
<cfset addRoute(name="edit_page_path", pattern="/admin/page/[key]", controller="pages", action="edit")>
<cfset addRoute(name="delete_page_path", pattern="/admin/page/delete/[id]", controller="pages", action="delete")>

<!--- SNIPPET ROUTES --->
<cfset addRoute(name="snippets_path", pattern="/admin/snippets", controller="snippets", action="index")>
<cfset addRoute(name="new_snippet_path", pattern="/admin/snippet/new", controller="snippets", action="new")>
<cfset addRoute(name="edit_snippet_path", pattern="/admin/snippet/[key]", controller="snippets", action="edit")>
<cfset addRoute(name="delete_snippet_path", pattern="/admin/snippet/delete/[id]", controller="snippets", action="delete")>

<!--- LAYOUT ROUTES --->
<cfset addRoute(name="layouts_path", pattern="/admin/layouts", controller="layouts", action="index")>
<cfset addRoute(name="new_layout_path", pattern="/admin/layout/new", controller="layouts", action="new")>
<cfset addRoute(name="edit_layout_path", pattern="/admin/layout/[key]", controller="layouts", action="edit")>
<cfset addRoute(name="delete_layout_path", pattern="/admin/layout/delete/[id]", controller="layouts", action="delete")>


<!--- ADMIN HOME --->
<cfset addRoute(name="admin_path", pattern="/admin", controller="pages", action="index")>
  
<!--- THIS ROUTE IS WHAT DISPLAYS OUR PAGES FOR US --->
<cfset addRoute(name="viewer", pattern="/[slug]", controller="viewer", action="index")>
  
