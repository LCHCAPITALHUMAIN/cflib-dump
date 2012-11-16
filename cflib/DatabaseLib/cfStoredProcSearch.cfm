<cffunction name="cfStoredProcSearch" access="public" returntype="query" output=false>

	<cfargument name="datasource" type="string" required="true"/>
	<cfargument name="searchString" type="string" required="true"/>
	<cfset var qStoredProcSearch = "">

	<cfquery name="qStoredProcSearch" datasource="#arguments.datasource#">
		select name
		from sysobjects s
		   , syscomments c
		where s.id = c.id and text like '%#arguments.searchString#%'
	</cfquery>


	<cfreturn qStoredProcSearch />

</cffunction>