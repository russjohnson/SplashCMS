<cfoutput>
  <div class="flash">
    <cfif flashKeyExists('error')>
      <div class="message error">
        <p>#flash('error')#</p>
      </div>
    <cfelseif flashKeyExists('success')>
      <div class="message success">
        <p>#flash('success')#</p>
      </div>
    <cfelseif flashKeyExists('warning')>
      <div class="message warning">
        <p>#flash('warning')#</p>
      </div>
    </cfif>  
  </div>
</cfoutput>