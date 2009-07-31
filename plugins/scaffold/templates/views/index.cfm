<h1>Listing [NamePluralLowercase]</h1>

<cftable query="[NamePluralLowercase]" colHeaders="true" HTMLTable="true">
	LISTINGCOLUMNS
	<cfcol header="" text="#linkTo(text='Show', action='show', key=[PrimaryKey])#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=[PrimaryKey])#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=[PrimaryKey], confirm='Are you sure?')#" />
</cftable>

<cfoutput>
	<p>#linkTo(text="New [NameSingularLowercase]", action="new")#</p>
</cfoutput>