<cfscript>
	//  LOGIN ROUTES 
	addRoute(name="login", pattern="/admin/login", controller="sessions", action="new");
	addRoute(name="login_path", pattern="/admin/doLogin", controller="sessions", action="create");
	addRoute(name="logout", pattern="/admin/logout", controller="sessions", action="destroy");
  
	//  PAGE ROUTES 
	addRoute(name="edit_home_page_path", pattern="/admin/pages/home/edit/[key]", controller="pages", action="edit");
	addRoute(name="edit_page_path", pattern="/admin/pages/[parentID]/child/edit/[key]", controller="pages", action="edit");
	addRoute(name="new_page_path", pattern="/admin/pages/[parentID]/child/new", controller="pages", action="new");
	addRoute(name="delete_page_path", pattern="/admin/pages/delete/[key]", controller="pages", action="delete");
	addRoute(name="create_page_path", pattern="/admin/pages/[parentID]/create", controller="pages", action="create");
	addRoute(name="update_page_path", pattern="/admin/pages/update/[key]", controller="pages", action="update");
	addRoute(name="pages_path", pattern="/admin/pages", controller="pages", action="index");

	//  SNIPPET ROUTES 

	addRoute(name="new_snippet_path", pattern="/admin/snippets/new", controller="snippets", action="new");
	addRoute(name="edit_snippet_path", pattern="/admin/snippets/edit/[key]", controller="snippets", action="edit");
	addRoute(name="delete_snippet_path", pattern="/admin/snippets/delete/[key]", controller="snippets", action="delete");
	addRoute(name="create_snippet_path", pattern="/admin/snippets/create", controller="snippets", action="create");
	addRoute(name="update_snippet_path", pattern="/admin/snippets/update/[key]", controller="snippets", action="update");
	addRoute(name="snippets_path", pattern="/admin/snippets", controller="snippets", action="index");
    
	//  CATEGORY ROUTES 
	addRoute(name="delete_category_path", pattern="/admin/categories/delete/[key]", controller="categories", action="delete");
	addRoute(name="create_category_path", pattern="/admin/categories/create", controller="categories", action="create");
	addRoute(name="update_category_path", pattern="/admin/categories/update/[key]", controller="categories", action="update");


	//  LAYOUT ROUTES 
	addRoute(name="new_layout_path", pattern="/admin/layouts/new", controller="layouts", action="new");
	addRoute(name="delete_layout_path", pattern="/admin/layouts/delete/[key]", controller="layouts", action="delete");
	addRoute(name="create_layout_path", pattern="/admin/layouts/create", controller="layouts", action="create");
	addRoute(name="update_layout_path", pattern="/admin/layouts/update/[key]", controller="layouts", action="update");
	addRoute(name="edit_layout_path", pattern="/admin/layouts/edit/[key]", controller="layouts", action="edit");
	addRoute(name="reorder_layouts_path", pattern="/admin/layouts/reorder", controller="layouts", action="reorder");
	addRoute(name="layouts_path", pattern="/admin/layouts", controller="layouts", action="index");

	//  USER MANAGEMENT ROUTES 
	addRoute(name="new_user_path", pattern="/admin/users/new", controller="users", action="new");
	addRoute(name="edit_user_path", pattern="/admin/users/edit/[key]", controller="users", action="edit");
	addRoute(name="delete_user_path", pattern="/admin/users/delete/[key]", controller="users", action="delete");
	addRoute(name="create_user_path", pattern="/admin/users/create", controller="users", action="create");
	addRoute(name="update_user_path", pattern="/admin/users/update/[key]", controller="users", action="update");
	addRoute(name="users_path", pattern="/admin/users", controller="users", action="index");

	//  ADMIN HOME 
	addRoute(name="admin_path", pattern="/admin", controller="pages", action="index");
  
	//  THIS ROUTE IS WHAT DISPLAYS OUR PAGES FOR US 
	addRoute(name="viewer", pattern="[parent]/subpage1/subpage2/[slug]", controller="viewer", action="index");
	addRoute(name="viewer", pattern="[parent]/subpage1/[slug]", controller="viewer", action="index");
	addRoute(name="viewer", pattern="[parent]/[slug]", controller="viewer", action="index");
	addRoute(name="viewer", pattern="/[slug]", controller="viewer", action="index");
  
	  //  HOME ROUTE 
	addRoute(name="home", pattern="", controller="viewer", action="index");
</cfscript>