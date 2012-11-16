<cffunction name="dayOfYearReverse" returntype="date" hint="Accepts the day of Year (Integer) and year in question, and returns the date" output="false">
        <cfargument name="currentDayOfYear" type="numeric" required="yes">
        <cfargument name="currentYear" type="numeric" default="#year(now())#" required="no">
        <cfreturn dateAdd("d",arguments.currentDayOfYear, createDate(arguments.currentyear-1,"12","31" ))>
</cffunction>