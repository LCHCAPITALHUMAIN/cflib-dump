<cffunction name="flush" returnType="void">
	<cfargument name="interval"  type="numeric" required="false">
	<cfif isDefined("interval")>
		<cfflush interval="#interval#">
	<cfelse>
		<cfflush>
	</cfif>
</cffunction>