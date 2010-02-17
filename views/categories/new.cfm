<h1>Create new category</h1>

<cfoutput>

			#errorMessagesFor("category")#
	
			#startFormTag(action="create")#
		
				
						#textField(objectName='category', property='name', label='Name')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
