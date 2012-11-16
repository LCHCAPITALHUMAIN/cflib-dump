<cffunction name="httpDate" output="true" returntype="numeric" hint="Format a date as required by HTTP specifications">
	<cfargument name="theDate" type="date" required="false" default="#Now()#" hint="Date to format, default to Now()">
	<cfset var returnDate="#DateFormat(arguments.theDate, 'ddd, dd mmm yyyy')# #TimeFormat(arguments.theDate, 'HH:mm:ss')# GMT">
	<cfreturn returnDate>
</cffunction>