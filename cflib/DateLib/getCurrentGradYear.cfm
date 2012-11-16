<cffunction name="getCurrentGradYear" returntype="numeric">
	<!---last month of a schoolyear--->
	<cfargument name="switchmonth" type="numeric" required="no" default="6">
	<cfset var currGradYear = -1>

	<!---if the current month is between January and the last month of the schoolyear, 
	set the current graduation year to the current year--->
	<cfif month(now()) gte 1 and month(now()) lte arguments.switchmonth>
		<cfset currGradYear = year(now())>
	<!---if the current month is between the first month of the schoolyear and December,
	 set the current graduation year to be next year--->
	<cfelseif month(now()) gt arguments.switchmonth and month(now()) lte 12>
		<cfset currGradYear = year(now()) + 1>
	</cfif>
	<cfreturn currGradYear>
</cffunction>