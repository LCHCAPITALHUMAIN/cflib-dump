<cffunction name="directoryRename" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfargument name="newDirectory" type="string" required="true">
	<cfdirectory action="rename" directory="#directory#" newDirectory="#newDirectory#">
</cffunction>