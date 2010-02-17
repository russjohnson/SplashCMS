<style type="text/css">
	#dialog label, #dialog input { display:block; }
	#dialog label { margin-top: 0.5em; }
	#dialog input, #dialog textarea { width: 95%; }
</style>

<cfoutput>
<div id="dialog" title="Snippet Category">
    <p id="validateTips">A Category name is required.</p>
    <form action="" class="form" id="category-form">
        <fieldset class="ui-helper-reset">
			#textField(objectName="category", property="name", label="Category Name", class="ui-widget-content ui-corner-all")#
		</fieldset>
    #endFormTag()#
	<!--- <form>
	       <fieldset class="ui-helper-reset">
	           <label for="tab_title">Name</label>
	           <input type="text" name="tab_title" id="tab_title" value="" class="ui-widget-content ui-corner-all" />
	       </fieldset>
	   </form> --->
</div>
</cfoutput>