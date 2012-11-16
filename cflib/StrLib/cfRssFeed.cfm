<cffunction name="cfRssFeed" access="public" returntype="query" output=false>
	<cfargument name="feedUrl" type="string" required="true"/>
	<cfset var news_file = arguments.feedurl>
	<cfset var rss = "">
	<cfset var items = "">
	<cfset var rssItems = "">
	<cfset var i = "">
	<cfset var row = "">
	<cfset var title = "">
	<cfset var link = "">
	
	<cfhttp url="#news_file#" method="get" />
	
	<cfset rss = xmlParse(cfhttp.filecontent)>

	<cfset items = xmlSearch(rss, "/rss/channel/item")>
	<cfset rssItems = queryNew("title,description,link")>

	<cfloop from="1" to="#ArrayLen(items)#" index="i">
		<cfset row = queryAddRow(rssItems)>
		<cfset title = xmlSearch(rss, "/rss/channel/item[#i#]/title")>

		<cfif arrayLen(title)>
			<cfset title = title[1].xmlText>
		<cfelse>
			<cfset title="">
		</cfif>

		<cfset description = XMLSearch(items[i], "/rss/channel/item[#i#]/description")>

		<cfif ArrayLen(description)>
			<cfset description = description[1].xmlText>
		<cfelse>
			<cfset description="">
		</cfif>

		<cfset link = xmlSearch(items[i], "/rss/channel/item[#i#]/link")>

		<cfif arrayLen(link)>
			<cfset link = link[1].xmlText>
		<cfelse>
			<cfset link="">
		</cfif>

		<cfset querySetCell(rssItems, "title", title, row)>
		<cfset querySetCell(rssItems, "description", description, row)>
		<cfset querySetCell(rssItems, "link", link, row)>

	</cfloop>

	<cfreturn rssItems />

</cffunction>