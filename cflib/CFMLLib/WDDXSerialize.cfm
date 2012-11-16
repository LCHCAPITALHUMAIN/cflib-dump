<cffunction name="wddxSerialize" output="false" returnType="string">
	<cfargument name="input" type="any" required="true">
	<cfargument name="useTimeZoneInfo" type="boolean" required="false" default="true">
	
	<cfset var output="">
	
	<cfwddx action="cfml2wddx" input="#input#" output="output" useTimeZoneInfo="#useTimeZoneInfo#">
	<cfreturn output>
</cffunction>