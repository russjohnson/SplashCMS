<!--- HOME ROUTE --->
<cfset addRoute(name="home", pattern="", controller="viewer", action="index")>

<!--- LOGIN ROUTES --->
<cfset addRoute(name="login", pattern="/admin/login", controller="sessions", action="new")>
<cfset addRoute(name="login_path", pattern="/admin/doLogin", controller="sessions", action="create")>
<cfset addRoute(name="logout", pattern="/admin/logout", controller="sessions", action="destroy")>
  
<!--- PAGE ROUTES --->
<cfset addRoute(name="new_page_path", pattern="/admin/pages/[parentID]/child/new", controller="pages", action="new")>
<cfset addRoute(name="pages_path", pattern="/admin/pages", controller="pages", action="index")>
<cfset addRoute(name="edit_page_path", pattern="/admin/page/[key]", controller="pages", action="edit")>
<cfset addRoute(name="delete_page_path", pattern="/admin/page/delete/[id]", controller="pages", action="delete")>
<cfset addRoute(name="create_page_path", pattern="/admin/page/create", controller="pages", action="create")>
<cfset addRoute(name="update_page_path", pattern="/admin/page/update", controller="pages", action="update")>

<!--- SNIPPET ROUTES --->
<cfset addRoute(name="snippets_path", pattern="/admin/snippets", controller="snippets", action="index")>
<cfset addRoute(name="new_snippet_path", pattern="/admin/snippet/new", controller="snippets", action="new")>
<cfset addRoute(name="edit_snippet_path", pattern="/admin/snippet/[key]", controller="snippets", action="edit")>
<cfset addRoute(name="delete_snippet_path", pattern="/admin/snippet/delete/[id]", controller="snippets", action="delete")>
<cfset addRoute(name="create_snippet_path", pattern="/admin/snippet/create", controller="snippets", action="create")>
<cfset addRoute(name="update_snippet_path", pattern="/admin/snippet/update", controller="snippets", action="update")>

<!--- LAYOUT ROUTES --->
<cfset addRoute(name="new_layout_path", pattern="/admin/layouts/new", controller="layouts", action="new")>
<cfset addRoute(name="delete_layout_path", pattern="/admin/layouts/delete/[id]", controller="layouts", action="delete")>
<cfset addRoute(name="create_layout_path", pattern="/admin/layouts/create", controller="layouts", action="create")>
<cfset addRoute(name="update_layout_path", pattern="/admin/layouts/update/[key]", controller="layouts", action="update")>
<cfset addRoute(name="edit_layout_path", pattern="/admin/layouts/edit/[key]", controller="layouts", action="edit")>
<cfset addRoute(name="layouts_path", pattern="/admin/layouts", controller="layouts", action="index")>


<!--- ADMIN HOME --->
<cfset addRoute(name="admin_path", pattern="/admin", controller="pages", action="index")>
  
<!--- THIS ROUTE IS WHAT DISPLAYS OUR PAGES FOR US --->
<cfset addRoute(name="viewer", pattern="/[slug]", controller="viewer", action="index")>
  
