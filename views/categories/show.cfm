<h1>Showing category</h1>

<cfoutput>

					<p><label>Id</label> <br />
						#category.id#</p>
				
					<p><label>Name</label> <br />
						#category.name#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this category", action="edit", key=category.id)#
</cfoutput>
