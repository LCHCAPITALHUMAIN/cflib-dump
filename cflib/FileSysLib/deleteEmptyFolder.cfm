<cffunction name="deleteEmptyFolder" access="public" output="false" returntype="boolean">
	<cfargument name="path" required="true" type="string" />
	<cfset var qList="">
	<cfset var qDir = "">
	<cfset var qFiles = "">
	<cfset var isEmpty = 1>
	<!--- List Directory --->
	<cfdirectory action="list" directory="#arguments.path#" recurse="no" name="qList">
	<!--- get sub directory list --->
	<cfquery name="qDir" dbtype="query">
		select * from qList where type='Dir'
	</cfquery>
	<!--- Call recursive function to check directory empty or not --->
	<cfloop query="qDir">
		<!--- If sub directory not empty mark current directory as not empty. --->
		<cfif not deleteEmptyFolder(qDir.directory & "\" & qDir.name)>
			<cfset isEmpty=0>
		</cfif>
	</cfloop>

	<!--- Check for file exists in current directory --->
	<cfquery name="qFiles" dbtype="query">
		select * from qList where type='File'
	</cfquery>
	<!--- If file exists mark as not empty --->
	<cfif qFiles.recordCount gt 0>
		<cfset isEmpty = 0>
	</cfif>

	<!--- If current directory empty then delete it --->
	<cfif isEmpty>
		<cfdirectory action="delete" recurse="false" directory="#arguments.path#">
	</cfif>
	<!--- Return empty status for current directory --->
	<cfreturn isEmpty>
</cffunction>