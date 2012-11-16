<cffunction name="queryRemoveColumns" output="false" returntype="query">
	<cfargument name="theQuery" type="query" required="yes">
	<cfargument name="columnsToRemove" type="string" required="yes">
	<cfset var columnList=theQuery.columnList>
	<cfset var columnPosition="">
	<cfset var c="">
	<cfset var newQuery="">
	<cfloop list="#arguments.columnsToRemove#" index="c">
		<cfset columnPosition=ListFindNoCase(columnList,c)>
		<cfif columnPosition NEQ 0>
			<cfset columnList=ListDeleteAt(columnList,columnPosition)>
		</cfif>
	</cfloop>
	<cfquery name="newQuery" dbtype="query">
		SELECT #columnList# FROM theQuery
	</cfquery>
	<cfreturn newQuery>
</cffunction>