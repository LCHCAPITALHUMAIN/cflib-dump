<cffunction name="googleURLShorten" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfargument name="apiKey" type="string" required="false" default="" hint="API key identifies your application to Google">

	<cfset var requestURL = "https://www.googleapis.com/urlshortener/v1/url">
	<cfset var httpResult = "">
	<cfset var result = "">
	<cfset var response = "">
	<cfset var body = {"longUrl"=arguments.url}>
	<cfset body = serializeJson(body)>

	<cfif arguments.apiKey NEQ "">
	    <cfset requestURL=requestURL & "?key=" & arguments.apiKey>
	</cfif>

	<cfhttp url="#requestURL#" method="post" result="httpResult">
		<cfhttpparam type="header" name="Content-Type" value="application/json">
		<cfhttpparam type="body" value="#body#">
	</cfhttp>
	<cfset response=deserializeJSON(httpResult.filecontent.toString())>

    <cfif structkeyexists(response, 'error')>
        <cfset result=response.error.message>
    <cfelse>
        <!--- No Errors, return response.id (which is the shortened url) --->
        <cfset result=response.id>
    </cfif>

	<cfreturn result>
</cffunction>