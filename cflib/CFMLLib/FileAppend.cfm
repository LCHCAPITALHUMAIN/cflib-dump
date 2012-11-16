<cffunction name="fileAppend" output="false" returnType="void">
	<cfargument name="file" type="string" required="true">
	<cfargument name="output" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="addNewLine" type="boolean" default="yes" required="false">
	<cfargument name="attributes" type="string" default="" required="false">
	<cfif mode is "">
		<cffile action="append" file="#file#" output="#output#" addNewLine="#addNewLine#" attributes="#attributes#">	
	<cfelse>
		<cffile action="append" file="#file#" output="#output#" mode="#mode#" addNewLine="#addNewLine#" attributes="#attributes#">	
	</cfif>
</cffunction>