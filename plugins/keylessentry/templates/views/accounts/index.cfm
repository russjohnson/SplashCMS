<cfoutput>
  #includePartial(name="sub_nav")#
</cfoutput>
  
<div class="content">
  <cfif session.currentUser.assignmentCount() gt 0>
    <h2 class="title">Overview  </h2>
    <div class="inner">
      <cfoutput>You have <strong>#session.currentuser.assignmentCount()#</strong> projects right now.</cfoutput>
      This could be our view for the dashboard perhaps.
    </div>
  <cfelse>
    <h2 class="title">Create a project</h2>
    <div class="inner">
      You need to create a project to get started
    </div>
  </cfif>
</div>