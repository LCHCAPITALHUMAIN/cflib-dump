<cffunction name="googleURLExpand" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfset var httpResult = "">
	<cfset var result = "">

	<cfhttp url="https://www.googleapis.com/urlshortener/v1/url?shortUrl=#urlEncodedFormat(arguments.url)#" method="get" result="httpResult"></cfhttp>

	<cfset result = httpResult.filecontent.toString()>
	<cfreturn deserializeJSON(result).longUrl>
</cffunction>