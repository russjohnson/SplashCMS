<cfoutput>
  <div id="user-navigation">
    <ul>
      <li>#linkTo(text=session.currentUser.name, route="edit_user_path", key=session.currentUser.id)#</li>
      <li>#linkTo(text="Logout", route="logout", class="logout")#</li>
    </ul>
    <div class="clear"></div>
  </div>
</cfoutput>