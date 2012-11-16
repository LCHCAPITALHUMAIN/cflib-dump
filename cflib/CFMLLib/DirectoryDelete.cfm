<cffunction name="directoryDelete" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfdirectory action="delete" directory="#directory#">
</cffunction>