<cffunction name="cfLipsum" output="no" returntype="string" displayname="cfLipsum" hint="get a lorem ipsum string from lipsum.com">
	<cfargument name="isFormatted" type="numeric" required="no" default="1" />

	<cfset var theXML = "" />
	<cfset var theGrab = "" />
	<cfset var theLipsum = "" />
	<cfset var theLipsumFeed = "http://www.lipsum.com/feed/xml" />
	
	<!--- get the xml feed --->
	<cfhttp url="#theLipsumFeed#" method="get" resolveUrl="false" />
	
	<!--- parse and search xml for lorem ipsum --->
	<cfset theXML = XMLParse(cfhttp.filecontent) />
	<cfset theGrab = XMLSearch(theXML, "/feed") />
	
	<!--- only one lorem ipsum element in the feed --->
	<cfset theLipsum = theGrab[1].lipsum.xmltext />
	
	<!--- strips lorem ipsum text of punctuation and uppercase --->
	<cfif arguments.isFormatted neq 1>
		<cfset theLipsum = lcase(rereplacenocase(theLipsum, "[^a-z0-9 ]", "", "all")) />
	</cfif>
	
	<cfreturn theLipsum />
</cffunction>