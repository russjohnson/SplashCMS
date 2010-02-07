<cfif thisTag.executionMode is "start">
  <cfparam name="attributes.slug" default="/" type="string" />

  <!--- How should errors like a missing slug be handled? --->

  <!--- How should tag syntax be documented? --->

  <cfset found = request.page.findOneBySlug(attributes.slug)>

  <!--- Return the variable back to the user --->
  <cfif IsObject(found)>
  	<cfif NOT IsDefined("request.tags")>
    	<cfset request.tags = {}>	
    </cfif>
  	<cfset request.tags.page = found>
  <!--- What if the slug isn't found? What should be put in request.tags.page? --->
  </cfif>
</cfif>

<!---
Based on the following Ruby code from Radiant CMS:

  tag 'find' do |tag|
    url = tag.attr['url']
    raise TagError.new("`find' tag must contain `url' attribute") unless url

    found = Page.find_by_url(absolute_path_for(tag.locals.page.url, url))
    if page_found?(found)
      tag.locals.page = found
      tag.expand
    end
  end
--->