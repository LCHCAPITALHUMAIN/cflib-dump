<cffunction name="goldenBirthday" access="public" returntype="date">
	<cfargument name="birthDate" type="date" required="yes">
	<cfreturn dateAdd("yyyy", day(birthDate),birthDate)>
</cffunction>