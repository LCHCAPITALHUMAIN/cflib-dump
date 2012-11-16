<cffunction name="directoryCreate" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfargument name="mode" type="string" required="false" default="">
	<cfif len(mode)>
		<cfdirectory action="create" directory="#directory#" mode="#mode#">
	<cfelse>
		<cfdirectory action="create" directory="#directory#">
	</cfif>
</cffunction>