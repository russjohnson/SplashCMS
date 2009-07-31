<cfset addRoute(name="[NamePluralLowercase]", pattern="[NamePluralLowercase]", controller="[NamePluralLowercase]", action="index")>
<cfset addRoute(name="new[NameSingularUppercase]", pattern="[NamePluralLowercase]/new", controller="[NamePluralLowercase]", action="new")>
<cfset addRoute(name="create[NameSingularUppercase]", pattern="[NamePluralLowercase]/create", controller="[NamePluralLowercase]", action="create")>
<cfset addRoute(name="edit[NameSingularUppercase]", pattern="[NamePluralLowercase]/edit/[key]", controller="[NamePluralLowercase]", action="edit")>
<cfset addRoute(name="update[NameSingularUppercase]", pattern="[NamePluralLowercase]/update", controller="[NamePluralLowercase]", action="update")>
<cfset addRoute(name="[NameSingularLowercase]", pattern="[NamePluralLowercase]/show/[key]", controller="[NamePluralLowercase]", action="show")>
<cfset addRoute(name="delete[NameSingularUppercase]", pattern="[NamePluralLowercase]/delete/[key]", controller="[NamePluralLowercase]", action="delete")>