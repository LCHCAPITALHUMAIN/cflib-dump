<cffunction name="urlExists" output="no" returntype="boolean">
	<!--- Accepts a URL --->
	<cfargument name="u" type="string" required="yes">

	<!--- Initialize result --->
	<cfset var result=true>

	<!--- Attempt to retrieve the URL --->
	<cfhttp url="#arguments.u#" resolveurl="no" throwonerror="no" />

	<!--- Check That a Status Code is Returned --->
	<cfif isDefined("cfhttp.responseheader.status_code")>
		<cfif cfhttp.responseheader.status_code EQ "404">
			<!--- If 404, return FALSE --->
			<cfset result=false>
		</cfif>
	<cfelse>
		<!--- No Status Code Returned --->
		<cfset result=false>
	</cfif>
	<cfreturn result>
</cffunction>