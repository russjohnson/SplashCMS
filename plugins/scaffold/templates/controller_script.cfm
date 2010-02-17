component extends="Controller" output="false" {
  
  public void function init(){
  }
  
  // [NamePluralLowercaseDeHumanized]/index
  public void function index(){
    [NamePluralLowercase] = model("[NameSingularUppercase]").findAll();
  }
  
  // [NamePluralLowercaseDeHumanized]/show/key
  public void function show(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key);
    	
    if (!IsObject([NameSingularLowercase])){
      flashInsert(error="[NameSingularUppercase] #params.key# was not found");
      redirectTo(action="index");
    }
  }
  
  // [NamePluralLowercaseDeHumanized]/new
  public void function new(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").new();
  }
  
  //[NamePluralLowercaseDeHumanized]/edit/key
  public void function edit(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key);
    	
    if (!IsObject([NameSingularLowercase])){
	    flashInsert(error="[NameSingularUppercase] #params.key# was not found");
			redirectTo(action="index");
	  }
  }
  
  // [NamePluralLowercaseDeHumanized]/create
  public void function create(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").new(params.[NameSingularLowercase]);
		
		if ([NameSingularLowercase].save()){
			flashInsert(success="The [NameSingularLowercase] was created successfully.");
      redirectTo(action="index");
		} else {
		  flashInsert(error="There was an error creating the [NameSingularLowercase].");
		  renderPage(action="new");
		}
  }
  
  // [NamePluralLowercaseDeHumanized]/update
  public void function update(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key);
		
		if ([NameSingularLowercase].update(params.[NameSingularLowercase])){
		  flashInsert(success="The [NameSingularLowercase] was updated successfully.");
      redirectTo(action="index");
		} else {
		  flashInsert(error="There was an error updating the [NameSingularLowercase].");
			renderPage(action="edit");
		}
  }
  
  // [NamePluralLowercaseDeHumanized]/delete/key
  public void function delete(){
    [NameSingularLowercase] = model("[NameSingularUppercase]").findByKey(params.key);

		if ([NameSingularLowercase].delete()){
			flashInsert(success="The [NameSingularLowercase] was deleted successfully.");
      redirectTo(action="index");
    } else {
      flashInsert(error="There was an error deleting the [NameSingularLowercase].");
			redirectTo(action="index");
    }
  }
  
}