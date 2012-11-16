<cffunction name="QuerySort" output="no" returnType="query">
	<cfargument name="query" type="query" required="true">
	<cfargument name="column" type="string" required="true">
	<cfargument name="sortDir" type="string" required="false" default="asc">

	<cfset var newQuery = "">
	
	<cfquery name="newQuery" dbType="query">
		select * from query
		order by #column# #sortDir#
	</cfquery>
	
	<cfreturn newQuery>
	
</cffunction>