<h1>Showing layout</h1>

<cfoutput>

			
				
					<p><label>Id</label> <br />
						#layout.id#</p>
				
					<p><label>Name</label> <br />
						#layout.name#</p>
				
					<p><label>Content</label> <br />
						#layout.content#</p>
				
					<p><label>Created At</label> <br />
						#layout.createdAt#</p>
				
					<p><label>Updated At</label> <br />
						#layout.updatedAt#</p>
				
					<p><label>Created By Id</label> <br />
						#layout.createdById#</p>
				
					<p><label>Updated By Id</label> <br />
						#layout.updatedById#</p>
				
			
		

#linkTo(text="Return to the listing", action="action")# | #linkTo(text="Edit this layout", action="edit", key=layout.id)#
</cfoutput>
