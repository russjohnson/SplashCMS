<h1>Showing page</h1>

<cfoutput>

			
				
					<p><label>Id</label> <br />
						#page.id#</p>
				
					<p><label>Title</label> <br />
						#page.title#</p>
				
					<p><label>Slug</label> <br />
						#page.slug#</p>
				
					<p><label>Breadcrumb</label> <br />
						#page.breadcrumb#</p>
				
					<p><label>Class Name</label> <br />
						#page.className#</p>
				
					<p><label>Status I D</label> <br />
						#page.statusID#</p>
				
					<p><label>Parent I D</label> <br />
						#page.parentID#</p>
				
					<p><label>Layout I D</label> <br />
						#page.layoutID#</p>
				
					<p><label>Description</label> <br />
						#page.description#</p>
				
					<p><label>Keywords</label> <br />
						#page.keywords#</p>
				
					<p><label>Published At</label> <br />
						#page.publishedAt#</p>
				
					<p><label>Created At</label> <br />
						#page.createdAt#</p>
				
					<p><label>Updated At</label> <br />
						#page.updatedAt#</p>
				
					<p><label>Created By I D</label> <br />
						#page.createdByID#</p>
				
					<p><label>Updated By I D</label> <br />
						#page.updatedByID#</p>
				
			
		

#linkTo(text="Return to the listing", action="action")# | #linkTo(text="Edit this page", action="edit", key=page.id)#
</cfoutput>
