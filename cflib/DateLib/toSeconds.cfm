<cffunction name="toSeconds" access="public" output="false" returntype="numeric" hint="i take a time value and return the total number of seconds">
	<cfargument name="time" required="true" />
	<cfreturn (hour(arguments.time)*3600) + (minute(arguments.time)*60) + (second(arguments.time)) />
</cffunction>