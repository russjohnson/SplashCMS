<cfoutput>

  <div id="box">
    <h1>CMS Login</h1>
    <div class="block" id="block-login">
      <h2>Login</h2>
    
      <div class="content login">
        
        <div class="flash">
          <cfif flashKeyExists('error')>
            <div class="message error">
              <p>#flash('error')#</p>
            </div>
          <cfelseif flashKeyExists('warning')>
            <div class="message error">
              <p>#flash('notice')#</p>
            </div>
          </cfif>  
        </div>
      
        #startFormTag(route="login_path", class="form login")#
          <div class="group">
            <div class="left">
              <label class="label right">Login</label>
            </div>
            <div class="right">
              #textFieldTag(name="login", class="text_field")#
            </div>
            <div class="clear"></div>
          </div>
          <div class="group">
            <div class="left">
              <label class="label right">Password</label>
            </div>
            <div class="right">
              #passwordFieldTag(name="password", class="text_field")#
            </div>
            <div class="clear"></div>
          </div>
          <div class="group navform">
            <div class="right">
              #submitTag(value="Login", class="ui-button ui-state-default ui-corner-all")#
            </div>
            <div class="clear"></div>
          </div>
        #endFormTag()#
      
      </div>
    </div>
  </div>

</cfoutput>
