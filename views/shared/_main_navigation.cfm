<cfoutput>
  <div id="main-navigation">
    <ul>
      <li class="first <cfif params.controller is 'pages'>active</cfif>">
        #linkTo(text="Pages", route="pages_path")#
      </li>
      <li <cfif params.controller is 'snippets'>class="active"</cfif>>
        #linkTo(text="Snippets", route="snippets_path")#
      </li>
      <li <cfif params.controller is 'layouts'>class="active"</cfif>>
        #linkTo(text="Layouts", route="layouts_path")#
      </li>
      <li <cfif params.controller is 'settings'>class="active"</cfif>>
        <a href="">Settings</a>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
</cfoutput>