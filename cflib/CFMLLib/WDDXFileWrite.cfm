<cffunction name="WDDXFileWrite" output="no" returnType="void">
	<cfargument name="file" required="yes">
	<cfargument name="var" required="yes">
	
	<cfset var tempPacket = "">
	
	<!--- serialize --->
	<cfwddx action="cfml2wddx" input="#var#" output="tempPacket">
	<!--- write the file --->
	<cffile action="write" file="#file#" output="#tempPacket#">
</cffunction>