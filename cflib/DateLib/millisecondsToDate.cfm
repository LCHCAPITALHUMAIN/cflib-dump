<cffunction name="millisecondsToDate" access="public" output="false" returnType="date">
	<cfargument name="strMilliseconds" type="string" required="true">
	
	<cfreturn dateAdd("s", strMilliseconds/1000, "january 1 1970 00:00:00")>
</cffunction>