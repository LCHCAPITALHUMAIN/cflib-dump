<cffunction name="DeleteCFCache" output="false" returntype="boolean">
	<cfargument name="cachedFile" required="Yes" type="string">
	
	<cfset var qryDir = "">

	<!--- cfcache puts url encoding on files, lowercases them and removes percent signs --->
	<cfset arguments.cachedFile = URLEncodedFormat(arguments.cachedFile)>
	<cfif reFindNoCase("%2[A-Z]",arguments.cachedFile)>
		<cfset arguments.cachedFile = Replace(REReplace(arguments.cachedFile,"%2[A-Z]{1,1}",LCase(Mid(arguments.cachedFile,REFind("%2[A-Z]{1,1}",arguments.cachedFile),3)),"ALL"),"%","","ALL")>
	</cfif>
	
	<cfdirectory action="LIST" directory="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\" name="qryDir">
	<cfquery name="qryDir" dbtype="query">
		SELECT name
		FROM qryDir
		WHERE name like '%#arguments.cachedFile#%'
	</cfquery>
	<cfif not qryDir.recordcount>
		<cfreturn false>
	</cfif>
	<cfloop query="qryDir">
		<cffile action="DELETE" file="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\#qryDir.name#">
	</cfloop>
	<cfreturn true>
</cffunction>