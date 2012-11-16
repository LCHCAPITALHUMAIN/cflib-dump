<cffunction name="fileInfo" output="false" returntype="query">
	<cfargument name="fileName" type="string" required="true">

	<cfset var directory = "">
	<cfset var getFile = queryNew("")>
	
	<cfif not fileExists(fileName)>
		<cfthrow message="fileInfo error: #fileName# does not exist.">
	</cfif>
	<cfset directory = getDirectoryFromPath(fileName)>
	<cfdirectory name="getFile" directory="#directory#" filter="#getFileFromPath(fileName)#">
	<cfreturn getFile>
</cffunction>