<cfscript>
addRoute(name="[NamePluralLowercase]", pattern="[NamePluralLowercase]", controller="[NamePluralLowercase]", action="index");
addRoute(name="new[NameSingularUppercase]", pattern="[NamePluralLowercase]/new", controller="[NamePluralLowercase]", action="new");
addRoute(name="create[NameSingularUppercase]", pattern="[NamePluralLowercase]/create", controller="[NamePluralLowercase]", action="create");
addRoute(name="edit[NameSingularUppercase]", pattern="[NamePluralLowercase]/edit/[key]", controller="[NamePluralLowercase]", action="edit");
addRoute(name="update[NameSingularUppercase]", pattern="[NamePluralLowercase]/update", controller="[NamePluralLowercase]", action="update");
addRoute(name="[NameSingularLowercase]", pattern="[NamePluralLowercase]/show/[key]", controller="[NamePluralLowercase]", action="show");
addRoute(name="delete[NameSingularUppercase]", pattern="[NamePluralLowercase]/delete/[key]", controller="[NamePluralLowercase]", action="delete");
</cfscript>