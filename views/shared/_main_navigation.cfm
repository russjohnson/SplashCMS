<cfoutput>
    <div id="main-navigation">
        <ul>
            <li <cfif params.controller is 'pages'>class="active"</cfif>>
                #linkTo(text="Pages", route="pages_path")#
            </li>
            <li <cfif params.controller is 'snippets'>class="active"</cfif>>
                #linkTo(text="Snippets", route="snippets_path")#
            </li>
            <li <cfif params.controller is 'layouts'>class="active"</cfif>>
                #linkTo(text="Layouts", route="layouts_path")#
            </li>
            <li <cfif params.controller is 'users'>class="active"</cfif>>
                #linkTo(text="Users", route="users_path")#
            </li>
            <!---<li <cfif params.controller is 'settings'>class="active"</cfif>>
            <a href="">Settings</a>
            </li>--->
            <!--- <cfdump var="#application.admin.tabs#" /> --->
            <cfif structKeyExists(application, "tabs")>
                <cfloop from="1" to="#arrayLen(application.tabs.titles)#" index="i">
                <li>
                    <a href="##">#titleize(application.tabs.titles[i])#</a>
                </li>
                </cfloop>
            </cfif>
        </ul>
        <div class="clear"></div>
    </div>
</cfoutput>