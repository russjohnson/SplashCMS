<!--- HOME ROUTE --->
<cfset addRoute(name="home", pattern="", controller="viewer", action="index")>

<!--- LOGIN ROUTES --->
<cfset addRoute(name="login", pattern="/admin/login", controller="sessions", action="new")>
<cfset addRoute(name="login_path", pattern="/admin/doLogin", controller="sessions", action="create")>
<cfset addRoute(name="logout", pattern="/admin/logout", controller="sessions", action="destroy")>
  
<!--- PAGE ROUTES --->
<cfset addRoute(name="new_page_path", pattern="/admin/pages/[parentID]/child/new", controller="pages", action="new")>
<cfset addRoute(name="edit_page_path", pattern="/admin/pages/[parentID]/child/edit/[key]", controller="pages", action="edit")>
<cfset addRoute(name="delete_page_path", pattern="/admin/pages/delete/[id]", controller="pages", action="delete")>
<cfset addRoute(name="create_page_path", pattern="/admin/pages/[parentID]/create", controller="pages", action="create")>
<cfset addRoute(name="update_page_path", pattern="/admin/pages/update/[key]", controller="pages", action="update")>
<cfset addRoute(name="pages_path", pattern="/admin/pages", controller="pages", action="index")>

<!--- SNIPPET ROUTES --->

<cfset addRoute(name="new_snippet_path", pattern="/admin/snippets/new", controller="snippets", action="new")>
<cfset addRoute(name="edit_snippet_path", pattern="/admin/snippets/edit/[key]", controller="snippets", action="edit")>
<cfset addRoute(name="delete_snippet_path", pattern="/admin/snippets/delete/[id]", controller="snippets", action="delete")>
<cfset addRoute(name="create_snippet_path", pattern="/admin/snippets/create", controller="snippets", action="create")>
<cfset addRoute(name="update_snippet_path", pattern="/admin/snippets/update/[key]", controller="snippets", action="update")>
<cfset addRoute(name="snippets_path", pattern="/admin/snippets", controller="snippets", action="index")>

<!--- LAYOUT ROUTES --->
<cfset addRoute(name="new_layout_path", pattern="/admin/layouts/new", controller="layouts", action="new")>
<cfset addRoute(name="delete_layout_path", pattern="/admin/layouts/delete/[id]", controller="layouts", action="delete")>
<cfset addRoute(name="create_layout_path", pattern="/admin/layouts/create", controller="layouts", action="create")>
<cfset addRoute(name="update_layout_path", pattern="/admin/layouts/update/[key]", controller="layouts", action="update")>
<cfset addRoute(name="edit_layout_path", pattern="/admin/layouts/edit/[key]", controller="layouts", action="edit")>
<cfset addRoute(name="layouts_path", pattern="/admin/layouts", controller="layouts", action="index")>

<!--- USER MANAGEMENT ROUTES --->
<cfset addRoute(name="new_user_path", pattern="/admin/users/new", controller="users", action="new")>
<cfset addRoute(name="edit_user_path", pattern="/admin/users/edit/[key]", controller="users", action="edit")>
<cfset addRoute(name="delete_user_path", pattern="/admin/users/delete/[id]", controller="users", action="delete")>
<cfset addRoute(name="create_user_path", pattern="/admin/users/create", controller="users", action="create")>
<cfset addRoute(name="update_user_path", pattern="/admin/users/update/[key]", controller="users", action="update")>
<cfset addRoute(name="users_path", pattern="/admin/users", controller="users", action="index")>

<!--- ADMIN HOME --->
<cfset addRoute(name="admin_path", pattern="/admin", controller="pages", action="index")>
  
<!--- THIS ROUTE IS WHAT DISPLAYS OUR PAGES FOR US --->
<cfset addRoute(name="viewer", pattern="/[slug]", controller="viewer", action="index")>
  
