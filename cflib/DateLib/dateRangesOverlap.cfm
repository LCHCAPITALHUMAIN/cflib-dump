<cffunction name="dateRangesOverlap" returntype="boolean" output="false" hint="Returns true if two date ranges overlap by one or more days">
	<cfargument name="start1" type="date" required="true">
	<cfargument name="end1" type="date" required="true">
	<cfargument name="start2" type="date" required="true">
	<cfargument name="end2" type="date" required="true">
	<cfset var overlapFound = false>
	<cfset var datePart = "d">

	<cfif dateCompare(arguments.end1, arguments.start1, datePart) eq -1>
		<cfthrow message="End1 date cannot be earlier than start1 date">
	<cfelseif dateCompare(arguments.end2, arguments.start2, datePart) eq -1>
		<cfthrow message="End2 date cannot be earlier than start2 date">
	</cfif>
	<!--- first range starts within the second date range --->
	<cfif dateCompare(arguments.start1, arguments.start2, datePart) gte 0 and 
				dateCompare(arguments.start1, arguments.end2, datePart) lte 0>
		<cfset overlapFound = true>	
	<!--- first range ends within the second date range --->
	<cfelseif dateCompare(arguments.end1, arguments.start2, datePart) gte 0 and 
				dateCompare(arguments.end1, arguments.end2, datePart) lte 0>
		end between
		<cfset overlapFound = true>	
	<!--- first range spans the second date range --->
	<cfelseif dateCompare(arguments.start1, arguments.start2, datePart) lte 0 and 
				dateCompare(arguments.end1, arguments.end2, datePart) gte 0>
		spans		
		<cfset overlapFound = true>	
	</cfif>

	<cfreturn overlapFound>
</cffunction>