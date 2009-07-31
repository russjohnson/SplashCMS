<h1>Editing page</h1>

<cfoutput>

			
			
			#errorMessagesFor("page")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
											
				
					
											
				
					
						<p><label>Created By I D</label> <br />
							#textField(objectName='page', property='createdByID')#</p>
					
											
				
					
						<p><label>Updated By I D</label> <br />
							#textField(objectName='page', property='updatedByID')#</p>
					
											
				
					
						<p><label>Class Name</label> <br />
							#textField(objectName='page', property='className')#</p>
					
											
				
					
						<p><label>Slug</label> <br />
							#textField(objectName='page', property='slug')#</p>
					
											
				
					
						<p><label>Parent I D</label> <br />
							#textField(objectName='page', property='parentID')#</p>
					
											
				
					
											
				
					
						<p><label>Keywords</label> <br />
							#textField(objectName='page', property='keywords')#</p>
					
											
				
					
						<p><label>Published At</label> <br />
							#dateTimeSelect(objectName='page', property='publishedAt', dateOrder='year,month,day', monthDisplay='abbreviations')#</p>
					
											
				
					
						<p><label>Status I D</label> <br />
							#textField(objectName='page', property='statusID')#</p>
					
											
				
					
						<p><label>Layout I D</label> <br />
							#textField(objectName='page', property='layoutID')#</p>
					
											
				
					
						<p><label>Breadcrumb</label> <br />
							#textField(objectName='page', property='breadcrumb')#</p>
					
											
				
					
						<p><label>Title</label> <br />
							#textField(objectName='page', property='title')#</p>
					
											
				
					
						<p><label>Description</label> <br />
							#textField(objectName='page', property='description')#</p>
					
											
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
