<cffunction name="zDateFormat" returntype="string">
	<cfargument name="offset" type="string" required="true"/>
	<cfargument name="date" type="date" required="true"/>
	
	<cfset var sign = Left(offset, 1)/>
	<cfset var hours = Mid(offset, 2, 2)/>
	<cfset var minutes = Mid(offset, 4, 2)/>
	<cfset var zDate = "">
	<cfset var formattedDate = "">
	
	<cfif not IsNumeric(offset) or len(offset) neq 5 or (sign is not "-" and sign is not "+")>
		<cfthrow type="InvalidGMTOffsetFormatException" message="A valid GMT offset is of the form '-hhmm' or '+hhmm', with 'hh' being the number of hours and 'mm' being the number of minutes by which the date is offset from GMT."/>
	</cfif>
	
	<cfif sign Is "+">
		<cfset hours = -hours/>
		<cfset minutes = -minutes/>
	</cfif>
	
	<cfset zDate = dateAdd("n", minutes, dateAdd("h", hours, date))/>
	<cfset formattedDate = dateFormat(zDate, "yyyy-mm-dd") & "T" & timeFormat(zDate, "HH:mm:ss") & "Z"/>
	
	<cfreturn formattedDate/>
</cffunction>