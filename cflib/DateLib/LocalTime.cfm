<cffunction name="LocalTime" returnType="date" output="false" hint="Returns Local Time">
	<cfset var timeZoneInfo = GetTimeZoneInfo()>
	<!--- local time GMT offset. --->
	<cfset var offset = 9>
	<cfset var GMTtime = DateAdd('s', timeZoneInfo.UTCtotalOffset, Now() )>
	<cfset var theLocalTime = DateAdd('h',offset,GMTtime)>
	<cfreturn theLocaltime>
</cffunction>