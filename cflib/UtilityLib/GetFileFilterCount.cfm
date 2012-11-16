rsion 1, May 17, 2011
*/
<cffunction name="GetFileFilterCount" returntype="numeric" output="no">
	<cfargument name="directory" type="string" required="true" />
	<cfargument name="filter" type="string" required="true" />
	<cfset var theCount = 0 />
	<cfset var checkfiles = "">

	<cfif directoryExists(arguments.directory)>
		<cfdirectory action="LIST" directory="#arguments.directory#" name="CheckFiles" filter="#arguments.filter#" type="file" listinfo="name">
		<cfset theCount = CheckFiles.RecordCount />
	</cfif>
	<cfreturn theCount />
</cffunction>