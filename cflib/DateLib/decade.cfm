<cffunction name="decade" returntype="string" output="no">
	<cfargument name="year" type="numeric" required="yes">

	<cfset var startYear = arguments.year - (arguments.year MOD 10)>
	<cfset var endYear = arguments.year + (10 - (arguments.year MOD 10) - 1)>

	<cfreturn startYear & "-" & endYear>
</cffunction>