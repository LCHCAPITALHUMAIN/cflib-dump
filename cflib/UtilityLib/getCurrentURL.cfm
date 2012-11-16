<cffunction name="getCurrentURL" output="No" access="public" returnType="string">
	<cfset var theURL = getPageContext().getRequest().GetRequestUrl().toString()>
	<cfif len( CGI.query_string )><cfset theURL = theURL & "?" & CGI.query_string></cfif>
	<cfreturn theURL>
</cffunction>