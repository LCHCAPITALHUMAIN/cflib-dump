<cffunction name="getTwitterUser" output="false" returnType="struct">
	<cfargument name="screenname" type="string" required="true">
	<cfset var httpResult = "">
	
	<!--- remove the @ if they included it. --->
	<cfif left(arguments.screenname,1) is "@">
		<cfset arguments.screenname = right(arguments.screenname, len(arguments.screenname)-1)>
	</cfif>
	
	<cfset var theUrl = "http://api.twitter.com/1/users/show.json?screen_name=#arguments.screenname#">
	
	<cfhttp url="#theUrl#" result="httpResult">
	<cfset var result = deserializeJSON(httpResult.filecontent)>
	
	<cfif structKeyExists(result, "error")>
		<cfset result.success = false>
	<cfelse>
		<cfset result.success = true>
	</cfif>

	<cfreturn result>	
</cffunction>