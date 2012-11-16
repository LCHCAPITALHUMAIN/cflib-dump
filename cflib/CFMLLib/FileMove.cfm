<cffunction name="fileMove" output="false" returnType="void">
	<cfargument name="source" type="string" required="true">
	<cfargument name="destination" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="attributes" type="string" required="false" default="">
	<cfif len(mode)>
		<cffile action="move" source="#source#" destination="#destination#" mode="#mode#">
	<cfelse>
		<cffile action="move" source="#source#" destination="#destination#" attributes="#attributes#">
	</cfif>	
</cffunction>