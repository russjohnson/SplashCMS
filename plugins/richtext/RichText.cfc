<cfcomponent output="false">

    <cfscript>
    /* 
        richTextField() should work with objectname and property
        richTextTag() shoud be standalone
    */
    
    function init(){
        this.version = "1.0.1";
        return this;
    }
    </cfscript>
    
    <cffunction name="richTextField" returntype="string" access="public" output="false">
	    <cfargument name="objectName" type="any" required="true" hint="See documentation for @textField">
    	<cfargument name="property" type="string" required="true" hint="See documentation for @textField">
    	<cfargument name="label" type="string" required="false" default="#application.wheels.functions.textArea.label#" hint="See documentation for @textField">
    	<cfargument name="labelPlacement" type="string" required="false" default="#application.wheels.functions.textArea.labelPlacement#" hint="See documentation for @textField">
    	<cfargument name="prepend" type="string" required="false" default="#application.wheels.functions.textArea.prepend#" hint="See documentation for @textField">
    	<cfargument name="append" type="string" required="false" default="#application.wheels.functions.textArea.append#" hint="See documentation for @textField">
    	<cfargument name="prependToLabel" type="string" required="false" default="#application.wheels.functions.textArea.prependToLabel#" hint="See documentation for @textField">
    	<cfargument name="appendToLabel" type="string" required="false" default="#application.wheels.functions.textArea.appendToLabel#" hint="See documentation for @textField">
    	<cfargument name="errorElement" type="string" required="false" default="#application.wheels.functions.textArea.errorElement#" hint="See documentation for @textField">
    	<cfargument name="editor" type="string" required="false" default="markitup" hint="Must contain the name of one of the supported RTE's.">
    	<cfargument name="includeJSLibrary" type="string" required="false" default="true" hint="Tells the plugin wether or not it should add the primary JS library to the html head section.">
    	<cfscript>
    		var loc = {};
    		$insertDefaults(name="textArea", reserved="name", input=arguments);
    		loc.before = $formBeforeElement(argumentCollection=arguments);
    		loc.after = $formAfterElement(argumentCollection=arguments);
    		arguments.name = $tagName(arguments.objectName, arguments.property);
    		if (!StructKeyExists(arguments, "id"))
    			arguments.id = $tagId(arguments.objectName, arguments.property);
    		loc.content = $formValue(argumentCollection=arguments);
    		loc.returnValue = loc.before & $element(name="textarea", skip="objectName,property,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement", skipStartingWith="label", content=loc.content, attributes=arguments) & loc.after;
    		
    		// call our editor methods
    		if (arguments.editor is 'markitup'){
    		    $markItUp(argumentCollection=arguments);
    		}
    		if (arguments.editor is 'ckeditor'){
    		    $ckeditor(argumentCollection=arguments);
    		}
    	</cfscript>
    	<cfreturn loc.returnValue>
    </cffunction>
    
    
    <cffunction name="richTextTag" returntype="string" access="public" output="false">
        <cfargument name="name" type="string" required="true" hint="See documentation for @textFieldTag">
        <cfargument name="content" type="string" required="false" default="" hint="Content to display in `textarea` by default">
        <cfargument name="label" type="string" required="false" default="#application.wheels.functions.textAreaTag.label#" hint="See documentation for @textField">
        <cfargument name="labelPlacement" type="string" required="false" default="#application.wheels.functions.textAreaTag.labelPlacement#" hint="See documentation for @textField">
        <cfargument name="prepend" type="string" required="false" default="#application.wheels.functions.textAreaTag.prepend#" hint="See documentation for @textField">
        <cfargument name="append" type="string" required="false" default="#application.wheels.functions.textAreaTag.append#" hint="See documentation for @textField">
        <cfargument name="prependToLabel" type="string" required="false" default="#application.wheels.functions.textAreaTag.prependToLabel#" hint="See documentation for @textField">
        <cfargument name="appendToLabel" type="string" required="false" default="#application.wheels.functions.textAreaTag.appendToLabel#" hint="See documentation for @textField">
        <cfargument name="editor" type="string" required="false" default="markitup" hint="Must contain the name of one of the supported RTE's.">
    	<cfargument name="includeJSLibrary" type="string" required="false" default="true" hint="Tells the plugin wether or not it should add the primary JS library to the html head section.">
        <cfscript>
            var loc = {};
            arguments.property = arguments.name;
            arguments.objectName = {};
            arguments.objectName[arguments.name] = arguments.content;
            StructDelete(arguments, "name");
            StructDelete(arguments, "content");
            loc.returnValue = textArea(argumentCollection=arguments);
            
            // call our editor methods
    		if (arguments.editor is 'markitup'){
    		    $markItUp(argumentCollection=arguments);
    		}
    		if (arguments.editor is 'ckeditor') {
    		    $ckeditor(argumentCollection=arguments);
    		}
        </cfscript>
        <cfreturn loc.returnValue>
    </cffunction>

    <!--- *********************** EDITOR SPECIFIC METHODS *************************** --->
    
    <cffunction name="$markItUp" output="false">
        <cfargument name="includeJSLibrary" type="any" required="false" default="true">
        
        <cfset var jsFiles = ''>
        <cfset var cssFiles = ''>
        <cfset var jsFunctions = ''>
            
        <cfif structKeyExists(request,'markitupran') is false>
            <cfif arguments.includeJSLibrary is true>
                <cfset jsFiles = '<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>'>
            </cfif>
            
            <cfset jsFiles = jsFiles & '<script src="/files/plugins/richtext/markitup/jquery.markitup.pack.js" type="text/javascript"></script><script src="/files/plugins/richtext/markitup/sets/html/set.js" type="text/javascript"></script>'>
        
            <cfset cssFiles = cssFiles & '<link rel="stylesheet" type="text/css" href="/files/plugins/richtext/markitup/skins/simple/style.css" /><link rel="stylesheet" type="text/css" href="/files/plugins/richtext/markitup/sets/html/style.css" />'>
        
            <cfset jsFunctions = jsFunctions & '<script type="text/javascript">$(document).ready(function(){
                  // Add markItUp! to our textarea
                	$(".rteditor").markItUp(mySettings);
                });</script>'>
                
            <cfhtmlhead text="#jsFiles##cssFiles##jsFunctions#" />
            <cfset request.markitupran = true>
        </cfif>
    </cffunction>
    
    <cffunction name="$ckeditor" output="false" >
        <cfargument name="includeJSLibrary" type="any" required="false" default="true">
        
        <cfset var jsFiles = ''>
        <cfset var jsFunctions = ''>
        <cfset var options = ''>
            
        <cfif structKeyExists(arguments, 'options')>
            <cfset options = "function() {#arguments.options#}">
        </cfif>
        
        <cfif structKeyExists(request,'ckeditorran') is false>
            <cfif arguments.includeJSLibrary is true>
                <cfset jsFiles = '<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>'>
            </cfif>
            
            <cfset jsFiles = jsFiles & '<script type="text/javascript" src="/files/plugins/richtext/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="/files/plugins/richtext/ckeditor/adapters/jquery.js"></script>'>
        
            <cfset jsFunctions = jsFunctions & '<script type="text/javascript">$(document).ready(function(){
                  // Add ckEditor to our textarea
                	$(".rteditor").ckeditor(#options#);
                });</script>'>
                
            <cfhtmlhead text="#jsFiles##jsFunctions#" />
            <cfset request.ckeditorran = true>
        </cfif>
        
    </cffunction>
    
</cfcomponent>