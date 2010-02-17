<cfcomponent output="false" mixin="controller" environment="design,development">

	<cffunction name="init">
		<cfset this.version = "1.0">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="generateScaffold" access="public" returnType="string" hint="Creates a Model a Controller and the Views for the name of the argument passed" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object to scaffold">
		<cfargument name="type" type="string" required="true" default="everything" hint="Type of generation to execute, values are: everything, controller, model">
		<cfargument name="scriptStyle" type="string" required="false" default="false" hint="This option determines if it should generate tag based or script based controllers and models.">
		
		<cfset var loc = {}>
		
		<!--- Setup the information for the user --->
		<cfset loc.message = "">
		
		<!--- Check if there is a table for the object --->
		<cfset model(arguments.name)>
		
		<!--- Check which type of scaffold to execute --->
		<cfif arguments.type IS "everything">
			<!--- Create the model --->
		    <cfset loc.message = loc.message & $generateModel(arguments.name, arguments.scriptStyle) & "<br/>">
		    <!--- Create the views --->
			<cfset loc.message = loc.message & $generateViews(arguments.name) & "<br/>">
			<!--- Create the controller --->
		    <cfset loc.message = loc.message & $generateController(arguments.name, arguments.scriptStyle) & "<br/>">
		<cfelseif arguments.type IS "model">
			<!--- Create the model --->
		    <cfset loc.message = loc.message & $generateModel(arguments.name, arguments.scriptStyle) & "<br/>">
		<cfelseif arguments.type IS "controller">
		    <!--- Create the controller --->
		    <cfset loc.message = loc.message & $generateController(arguments.name, arguments.scriptStyle) & "<br/>">
	    </cfif>
	    
		<cfreturn loc.message>	    
	</cffunction>
	
	<cffunction name="$checkIfFileExists" access="public" returntype="boolean" hint="Checks if the desired object is already created" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the file to search for">
	    <cfargument name="type" type="string" required="true" hint="Type of file to look for (Model, View, Controller)">
	    
	    <cfset var loc = {}>
	 	
	    <!--- Expand the target folder --->
	    <cfswitch expression="#arguments.type#">
	    	<cfcase value="Model">
	    		<cfset loc.targetFolderPath = expandPath("models/")>
	        </cfcase>
	        <cfcase value="View">
	    		<cfset loc.targetFolderPath = expandPath("views/" & LCase(pluralize(arguments.name)))>
	        </cfcase>
	        <cfcase value="Controller">
	        	<cfset loc.targetFolderPath = expandPath("controllers/")>
	        </cfcase>
	    </cfswitch>
	    
	    <!--- Find the names of all the files in the targeted folder --->
	    <cfdirectory name="loc.files" action="list" directory="#loc.targetFolderPath#" type="file">
	    
	    <!--- Check if the desired file is already in the targeted folder --->
		<cfif FindNoCase(arguments.name, ValueList(loc.files.name)) GT 0 OR DirectoryExists(loc.targetFolderPath) AND arguments.type IS "View">
	    	<cfset loc.wasFound = true>
	    <cfelse>
	    	<cfset loc.wasFound = false>
		</cfif>
	    
	    <cfreturn loc.wasFound>
	</cffunction>
	
	<cffunction name="$moveFileToFolder" access="public" returntype="void" hint="Checks if the desired Model is already created" output="false">
		<cfargument name="name" type="string" required="true" hint="Name to set the file when moved">
	    <cfargument name="type" type="string" required="true" hint="Type of file to move for (Model, View, Controller)">
	    <cfargument name="scriptStyle" type="string" required="false" default="false">
	     
	    <cfset var loc = {}>
	    
	    <!--- Expand the destination folder and read the file move over --->
	    <cfswitch expression="#arguments.type#">
	    	<cfcase value="Model">
	            
				<!--- Expand the from and destination folders --->
	    		<cfset loc.fromFolderPath = expandPath("plugins/scaffold/templates")>
				<cfset loc.destinationFolderPath = expandPath("models")>
	            
	            <!--- Read the template file --->
	            <cfif arguments.scriptStyle is "true">
	             <cffile action="read" file="#loc.fromFolderPath#/model_script.cfm" variable="loc.file">
	            <cfelse>
	              <cffile action="read" file="#loc.fromFolderPath#/model.cfm" variable="loc.file">
	            </cfif>
	            
	            <!--- Replace the placeholders with real data to the user 
	    		<cfset loc.file = $replacePlaceHolders(loc.file, arguments.name)> --->
	            
	            <!--- Write the file in the corresponding folder --->
	            <cffile action="write" file="#loc.destinationFolderPath#/#capitalize(arguments.name)#.cfc" output="#loc.file#" mode="777"> 
	        </cfcase>
	        
	        <cfcase value="View">
	        	
	            <!--- Expand the from and destination folders --->
	    		<cfset loc.fromFolderPath = expandPath("plugins/scaffold/templates/views")>
	            <cfset loc.destinationFolderPath = expandPath("views/" & LCase(pluralize(arguments.name)))>
	            
	            <!--- Create the directory to store the views in --->
	            <cfif NOT DirectoryExists(loc.destinationFolderPath)>
	            	<cfdirectory action="create" directory="#loc.destinationFolderPath#" mode="777">
	            </cfif>
	            
	            <!--- Read the template files --->
	            <cffile action="read" file="#loc.fromFolderPath#/index.cfm" variable="loc.fileIndex">
	            <cffile action="read" file="#loc.fromFolderPath#/show.cfm" variable="loc.fileShow">
	            <cffile action="read" file="#loc.fromFolderPath#/new.cfm" variable="loc.fileNew">
	            <cffile action="read" file="#loc.fromFolderPath#/edit.cfm" variable="loc.fileEdit">
	            
	            <!--- Generate the forms and listing for the views --->
	            <cfset loc.entryForm = $generateEntryFormFromModel(arguments.name)>
	            <cfset loc.editForm = $generateEditFormFromModel(arguments.name)>
	            <cfset loc.indexListing = $generateListingViewFromModel(arguments.name)>
	            <cfset loc.showListing = $generateShowViewFromModel(arguments.name)>
	            
				<!--- Replace the placeholders names --->
	    		<cfset loc.fileIndex = $replacePlaceHolders(loc.fileIndex, arguments.name)>
	            <cfset loc.fileShow = $replacePlaceHolders(loc.fileShow, arguments.name)>
	            <cfset loc.fileNew = $replacePlaceHolders(loc.fileNew, arguments.name)>
	            <cfset loc.fileEdit = $replacePlaceHolders(loc.fileEdit, arguments.name)>
	            
	            <!--- Replace the placeholder forms --->
	            <cfset loc.fileNew = ReplaceNoCase(loc.fileNew, "ENTRYFORM", loc.entryForm)>
	            <cfset loc.fileEdit = ReplaceNoCase(loc.fileEdit, "EDITFORM", loc.editForm)>
	                      
	            <!--- Replace the placeholder listing --->
	            <cfset loc.fileIndex = ReplaceNoCase(loc.fileIndex, "LISTINGCOLUMNS", loc.indexListing)>
	            
	            <!--- Replace the placeholder show --->
	            <cfset loc.fileShow = ReplaceNoCase(loc.fileShow, "LISTINGCOLUMNS", loc.showListing)>
	                        
	            <!--- Write the file in the corresponding folder --->
	            <cffile action="write" file="#loc.destinationFolderPath#/index.cfm" output="#loc.fileIndex#" mode="777"> 
	            <cffile action="write" file="#loc.destinationFolderPath#/show.cfm" output="#loc.fileShow#" mode="777"> 
	            <cffile action="write" file="#loc.destinationFolderPath#/new.cfm" output="#loc.fileNew#" mode="777"> 
	            <cffile action="write" file="#loc.destinationFolderPath#/edit.cfm" output="#loc.fileEdit#" mode="777"> 
	            
	        </cfcase>
	        
	        <cfcase value="Controller">
	        	<!--- Expand the from and destination folders --->
	    		<cfset loc.fromFolderPath = expandPath("plugins/scaffold/templates")>
	            <cfset loc.destinationFolderPath = expandPath("controllers")>
	            
	            <!--- Read the template file --->
	            <cfif arguments.scriptStyle is 'true'>
	               <cffile action="read" file="#loc.fromFolderPath#/controller_script.cfm" variable="loc.file">
	            <cfelse>
	                <cffile action="read" file="#loc.fromFolderPath#/controller.cfm" variable="loc.file">
	            </cfif> 
	            
				<!--- Replace the placeholders with real data to the user --->
	    		<cfset loc.file = $replacePlaceHolders(loc.file, arguments.name)>
	            
	            <!--- Write the file in the corresponding folder --->
	            <cffile action="write" file="#loc.destinationFolderPath#/#capitalize(pluralize(arguments.name))#.cfc" output="#loc.file#" mode="777"> 
	        </cfcase>
	        
	        <cfdefaultcase>
	        	<!--- Display a nice Wheels error? --->
	        </cfdefaultcase>
	    </cfswitch>
	    
	</cffunction>
	
	<cffunction name="$replacePlaceHolders" access="public" returntype="string" hint="Replaces the placeholders in the templates" output="false">
		<cfargument name="content" type="string" required="true" hint="The content where the placeholders are located for replacing">
	    <cfargument name="value" type="string" required="true" hint="The value to replace the placeholders with">
	    
	    <cfset var loc = {}>
	    
	    <!--- Find all occurences of [NamePluralLowercaseDeHumanized] and replace it --->
	    <cfset loc.replacedContent = ReplaceNoCase(arguments.content, "[NamePluralLowercaseDeHumanized]", LCase($replaceUppercaseWithDash(pluralize(arguments.value))), "All")>
	    <!--- Find all occurences of [NamePluralLowercase] and replace it --->
	    <cfset loc.replacedContent = ReplaceNoCase(loc.replacedContent, "[NamePluralLowercase]", LCase(pluralize(arguments.value)), "All")>
	    <!--- Find all occurences of [NameSingularUppercase] and replace it --->
	    <cfset loc.replacedContent = ReplaceNoCase(loc.replacedContent, "[NameSingularUppercase]", capitalize(arguments.value), "All")>
	    <!--- Find all occurences of [NameSingularLowercase] and replace it--->
	    <cfset loc.replacedContent = ReplaceNoCase(loc.replacedContent, "[NameSingularLowercase]", LCase(arguments.value), "All")>
	    <!--- Find all occurences of [PrimaryKey] and replace it with the actual primary key(s) --->
	    <cfset loc.replacedContent = ReplaceNoCase(loc.replacedContent, "[PrimaryKey]", model(LCase(arguments.value)).primaryKey(), "All")>
	    
	    <cfreturn loc.replacedContent>
	    
	</cffunction>
	
	<cffunction name="$generateEntryFormFromModel" access="public" returnType="string" hint="Generates an entry form from a Model by reading the table schema" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the model to generator the form for">
		
		<cfset var loc = {}>
		
		<!--- Define the name of the object returned from the controller --->
		<cfset loc.nameInSingularLowercase = LCase(arguments.name)>
		<cfset loc.nameInPluralLowercase = LCase(pluralize(arguments.name))>
		<cfset loc.nameInPluralUppercase = capitalize(pluralize(arguments.name))>
		
		<!--- Introspect the table to find the column names and types --->		
		<cfset loc.columns = model(loc.nameInSingularLowercase).$classData()>
		<cfset loc.columnsInOrder = loc.columns.columnList>

		<cfprocessingdirective suppressWhiteSpace="true">
		<cfsavecontent variable="loc.form">
			
			<cfoutput>
			[errorMessagesFor("<cfoutput>#loc.nameInSingularLowercase#</cfoutput>")]
	
			[startFormTag(action="create")]
		
				<cfloop list="#loc.columnsInOrder#" index="loc.property">
					<cfif ListFindNoCase(model(loc.nameInSingularLowercase).primaryKey(), loc.columns.properties[loc.property].COLUMN) IS 0 AND loc.columns.properties[loc.property].COLUMN IS NOT "createdAt" AND loc.columns.properties[loc.property].COLUMN IS NOT "updatedAt" AND loc.columns.properties[loc.property].COLUMN IS NOT "deletedAt">
						[#$generateFormField(loc.nameInSingularLowercase, loc.columns.properties[loc.property])#]
					</cfif>											
				</cfloop>

				[submitTag()]
				
			[endFormTag()]
			</cfoutput>
		</cfsavecontent>
		</cfprocessingdirective>
		
		<!--- Replace the HTML comments with ColdFusion comments --->
		<cfset loc.form = Replace(loc.form, "<!--", "<!---", "All")>
		<cfset loc.form = Replace(loc.form, "-->", "--->", "All")>
		
		<!--- Replace the brackets with number signs --->
		<cfset loc.form = Replace(loc.form, "[", "##", "All")>
		<cfset loc.form = Replace(loc.form, "]", "##", "All")>
		
		<cfreturn loc.form>
	</cffunction>
	
	<cffunction name="$generateEditFormFromModel" access="public" returnType="string" hint="Generates an edit form from a Model by reading the table schema" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the model to generator the form for">
		
		<cfset var loc = {}>
		
		<!--- Define the name of the object returned from the controller --->
		<cfset loc.nameInSingularLowercase = LCase(arguments.name)>
		<cfset loc.nameInPluralLowercase = LCase(pluralize(arguments.name))>
		<cfset loc.nameInPluralUppercase = capitalize(pluralize(arguments.name))>
		
		<!--- Introspect the table to find the column names and types --->		
		<cfset loc.columns = model(loc.nameInSingularLowercase).$classData()>
		<cfset loc.columnsInOrder = loc.columns.columnList>
		
		<cfprocessingdirective suppressWhiteSpace="true">
		<cfsavecontent variable="loc.form">
			<cfoutput>
			[errorMessagesFor("<cfoutput>#loc.nameInSingularLowercase#</cfoutput>")]
	
			[startFormTag(action="update", key=params.key)]
		
				<cfloop list="#loc.columnsInOrder#" index="loc.property">
					<cfif ListFindNoCase(model(loc.nameInSingularLowercase).primaryKey(), loc.columns.properties[loc.property].COLUMN) IS 0 AND loc.columns.properties[loc.property].COLUMN IS NOT "createdAt" AND loc.columns.properties[loc.property].COLUMN IS NOT "updatedAt" AND loc.columns.properties[loc.property].COLUMN IS NOT "deletedAt">
						[#$generateFormField(loc.nameInSingularLowercase, loc.columns.properties[loc.property])#]
					</cfif>										
				</cfloop>
				
				[submitTag()]
				
			[endFormTag()]
			</cfoutput>
		</cfsavecontent>
		</cfprocessingdirective>
		
		<!--- Replace the HTML comments with ColdFusion comments --->
		<cfset loc.form = Replace(loc.form, "<!--", "<!---", "All")>
		<cfset loc.form = Replace(loc.form, "-->", "--->", "All")>
		
		<!--- Replace the brackets with number signs --->
		<cfset loc.form = Replace(loc.form, "[", "##", "All")>
		<cfset loc.form = Replace(loc.form, "]", "##", "All")>
		
		<cfreturn loc.form>
	</cffunction>
	
	<cffunction name="$generateFormField" access="public" returnType="string" hint="Generates a form field using Wheel's view helpers" output="false">
		<cfargument name="objectName" type="string" required="true" hint="Name of the object which holds the property">
		<cfargument name="columnObject" type="struct" required="true" hint="Struct of the database column">
		
		<cfset var loc = {}>

		<cfswitch expression="#arguments.columnObject.TYPE#">
			<cfcase value="cf_sql_bit,cf_sql_tinyint" delimiters=",">
				<!--- Return a checkbox --->
				<cfset loc.fieldTag = "checkBox(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfcase>

			<cfcase value="cf_sql_longvarchar">
				<!--- Return a textarea --->
				<cfset loc.fieldTag = "textArea(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfcase>

			<cfcase value="cf_sql_date">
				<!--- Return a calendar --->
				<cfset loc.fieldTag = "dateSelect(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfcase>

			<cfcase value="cf_sql_time">
				<!--- Return a time picker --->
				<cfset loc.fieldTag = "timeSelect(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfcase>

			<cfcase value="cf_sql_timestamp">
				<!--- Return a calendar and time picker --->
				<cfset loc.fieldTag = "dateTimeSelect(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', dateOrder='year,month,day', monthDisplay='abbreviations', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfcase>

			<cfdefaultcase>
				<!--- Return a text if everything fails --->
				<cfset loc.fieldTag = "textField(objectName='#arguments.objectName#', property='#arguments.columnObject.COLUMN#', label='#humanize(arguments.columnObject.COLUMN)#')">
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn loc.fieldTag>
	</cffunction>
	
	<cffunction name="$generateListingViewFromModel" access="public" returnType="string" hint="Generates a listing View from a Model by reading the table schema" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the model to generator the listing for">
		
		<cfset var loc = {}>
		
		<!--- Define the name of the object returned from the controller --->
		<cfset loc.nameInSingularLowercase = LCase(arguments.name)>
		<cfset loc.nameInPluralLowercase = LCase(pluralize(arguments.name))>
		<cfset loc.nameInPluralUppercase = capitalize(pluralize(arguments.name))>
		
		<!--- Introspect the table to find the column names --->
		<cfset loc.columns = model(loc.nameInSingularLowercase).$classData().columnList>
		
		<cfprocessingdirective suppressWhiteSpace="true">
		<cfsavecontent variable="loc.form">
			<cfoutput>
				<cfloop list="#loc.columns#" index="loc.column">
					[cfcol header="#humanize(loc.column)#" text="###loc.column###" /]
				</cfloop>
			</cfoutput>
		</cfsavecontent>
		</cfprocessingdirective>
		
		<!--- Replace the brackets with ColdFusion tag brackets --->
		<cfset loc.form = Replace(loc.form, "[", "<", "All")>
		<cfset loc.form = Replace(loc.form, "]", ">", "All")>
		
		<cfreturn loc.form>
	</cffunction>
	
	<cffunction name="$generateShowViewFromModel" access="public" returnType="string" hint="Generates a show View from a Model by reading the table schema" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the model to generator the show for">
		
		<cfset var loc = {}>
		
		<!--- Define the name of the object returned from the controller --->
		<cfset loc.nameInSingularLowercase = LCase(arguments.name)>
		<cfset loc.nameInPluralLowercase = LCase(pluralize(arguments.name))>
		<cfset loc.nameInPluralUppercase = capitalize(pluralize(arguments.name))>
		
		<!--- Introspect the table to find the column names --->
		<cfset loc.columns = model(loc.nameInSingularLowercase).$classData().columnList>
		
		<cfprocessingdirective suppressWhiteSpace="true">
		<cfsavecontent variable="loc.form">
			<cfoutput>
				<cfloop list="#loc.columns#" index="loc.column">
					<p><label>#humanize(loc.column)#</label> <br />
						###loc.nameInSingularLowercase & "." & loc.column###</p>
				</cfloop>
			</cfoutput>
		</cfsavecontent>
		</cfprocessingdirective>
		
		<!--- Replace the brackets with ColdFusion tag brackets --->
		<cfset loc.form = Replace(loc.form, "[", "<", "All")>
		<cfset loc.form = Replace(loc.form, "]", ">", "All")>
		
		<cfreturn loc.form>
	</cffunction>
	
	<cffunction name="$generateModel" access="public" returnType="string" hint="Creates a Model for the name of the argument passed" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		<cfargument name="scriptStyle" type="string" required="true">
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created --->
		<cfif $checkIfFileExists(arguments.name, "Model")>
		    <cfset loc.message = "File 'models/#capitalize(arguments.name)#.cfc' already exists so skipped.">
		<cfelse>
			<cfset $moveFileToFolder(arguments.name, "Model", arguments.scriptStyle)>
		    <cfset loc.message = "File 'models/#capitalize(arguments.name)#.cfc' created.">
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	<cffunction name="$generateViews" access="public" returnType="string" hint="Creates the 'index,show,new and edit' Views for the name of the argument passed" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		
		<cfset var loc = {}>
		
		<!--- Check that the folder to store the views has not been already created --->
		<cfif $checkIfFileExists(arguments.name, "View")>
		    <cfset loc.message = "Folder 'views/#LCase(pluralize(arguments.name))#/' already exists so skipped.">  
		<cfelse>
			<cfset $moveFileToFolder(arguments.name, "View")>
			<cfset loc.message = "Folder 'views/#LCase(pluralize(arguments.name))#/' created.">		
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	<cffunction name="$generateController" access="public" returnType="string" hint="Creates a Controller for the name of the argument passed" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		<cfargument name="scriptStyle" type="string" required="true">
		    
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created --->
		<cfif $checkIfFileExists(arguments.name, "Controller")>
		    <cfset loc.message = "File 'controllers/#capitalize(pluralize(arguments.name))#.cfc' already exists so skipped.">
		<cfelse>
			<cfset $moveFileToFolder(arguments.name, "Controller", arguments.scriptStyle)>
		    <cfset loc.message = "File 'controllers/#capitalize(pluralize(arguments.name))#.cfc' created.">
		</cfif>
		
		<cfreturn loc.message>
	</cffunction>
	
	<cffunction name="$generateRoutes" access="public" returnType="string" hint="Creates all the routes for the name of the argument passed" output="false">
		<cfargument name="name" type="string" required="true" hint="Name of the object">
		
		<cfset var loc = {}>
		
		<!--- Check that the file has not been already created 
		<cfif $checkIfFileExists(arguments.name, "Controller")>
		    <cfset loc.message = "File 'controllers/#capitalize(pluralize(arguments.name))#.cfc' already exists so skipped.">
		<cfelse>
			<cfset $moveFileToFolder(arguments.name, "Controller")>
		    <cfset loc.message = "File 'controllers/#capitalize(arguments.name)#.cfc' created.">
		</cfif>--->
		
		<cfreturn loc.message>
	</cffunction>
	
	<cffunction name="$replaceUppercaseWithDash" access="public" returnType="string" hint="Adds a dash before every upper case letter">
		<cfargument name="text" type="string" required="true">
		
		<cfset var loc = {}>
		<cfset loc.returnValue = REReplace(arguments.text, "([[:upper:]])", "-\1", "all")>
		
		<cfreturn loc.returnValue>
	</cffunction>
	
</cfcomponent>