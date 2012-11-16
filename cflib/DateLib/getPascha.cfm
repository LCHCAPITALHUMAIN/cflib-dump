<cffunction name="getPascha" returntype="date">
	<cfargument name="y" type="numeric" required="false" default="#year(now())#">
	
	<cfset var t = 0>
	<cfset var dd = 0>
	<cfset var mm = 0>
	
	<cfset t = (19 * (y mod 19) + 16) mod 30>
	<cfset dd = 3 + t + (2 * (y mod 4) + 4 * (y mod 7) + 6 * t) mod 7>

	<cfif y lt 1924>
		<cfset dd = dd - 13>
	</cfif>

	<cfif dd gt 30>
		<cfset dd = dd - 30>
		<cfset mm = 5>
	<cfelse>
		<cfset mm = 4>
	</cfif>
	
	<cfif dd lt 1>
		<cfset dd = dd + 31>
		<cfset mm = 3>
	</cfif>

  <cfreturn createDate(y, mm, dd)>
</cffunction>