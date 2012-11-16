<cffunction name="getHostFromURL" access="public" output="false" returntype="string">
	<cfargument name="url" required="false" default="" />
	<cfset var jURL = "" />
	<cfif len(arguments.url)>
		<cfset jURL = createObject("java", "java.net.URL").init(arguments.url) />
		<cfreturn jURL.getHost() />
	<cfelse>
		<cfreturn ""/>
	</cfif>
</cffunction>