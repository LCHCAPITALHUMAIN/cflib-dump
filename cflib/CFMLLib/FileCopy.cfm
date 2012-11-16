<cffunction name="fileCopy" output="false" returnType="void">
	<cfargument name="source" type="string" required="true">
	<cfargument name="destination" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="attributes" type="string" default="" required="false">
	<cfif len(mode)>
		<cffile action="copy" source="#source#" destination="#destination#" mode="#mode#">
	<cfelse>
		<cffile action="copy" source="#source#" destination="#destination#" attributes="#attributes#">
	</cfif>
</cffunction>