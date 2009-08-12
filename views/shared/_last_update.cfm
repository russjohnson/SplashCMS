<cfoutput>
  <p class="gray">
	  Last updated by #model('user').findByKey(arguments.updatedByID).name# on #dateFormat(arguments.updatedAt, 'long')# at #timeFormat(arguments.updatedAt, 'short')#
	</p>
</cfoutput>