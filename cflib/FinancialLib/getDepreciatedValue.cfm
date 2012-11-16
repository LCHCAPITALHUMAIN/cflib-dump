<cffunction name="getDepreciatedValue" output="no" returntype="numeric" hint="Calculates the current straight line depreciated value">
	<cfargument name="acq_cost" required="yes" type="numeric" hint="The acquistion cost or value of an item">
	<cfargument name="acq_date" type="date" required="yes" hint="the acquisition date of the item">
	<cfargument name="numberofYears" type="numeric" default="5" required="yes" hint="the number of years to depreciate the item.">
	<cfset var DV = "">
	<cfset var cost = arguments.acq_cost>
	<cfset var days = arguments.numberofYears * 365>
	<cfset var age = dateDiff('d', DateFormat(arguments.acq_date,'mm/dd/yyyy'), DateFormat(Now(),'mm/dd/yyyy'))>
	
	<cfif age gte days>
		<cfset age = days>
	</cfif>
	
	<cfset DV = (cost*((age/days)-1)*-1)>
	
	<cfreturn DV>
</cffunction>