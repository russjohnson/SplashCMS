<h1>Showing snippet</h1>

<cfoutput>

			
				
					<p><label>Id</label> <br />
						#snippet.id#</p>
				
					<p><label>Name</label> <br />
						#snippet.name#</p>
				
					<p><label>Content</label> <br />
						#snippet.content#</p>
				
					<p><label>Created At</label> <br />
						#snippet.createdAt#</p>
				
					<p><label>Updated At</label> <br />
						#snippet.updatedAt#</p>
				
					<p><label>Created By I D</label> <br />
						#snippet.createdByID#</p>
				
					<p><label>Updated By I D</label> <br />
						#snippet.updatedByID#</p>
				
			
		

#linkTo(text="Return to the listing", action="action")# | #linkTo(text="Edit this snippet", action="edit", key=snippet.id)#
</cfoutput>
