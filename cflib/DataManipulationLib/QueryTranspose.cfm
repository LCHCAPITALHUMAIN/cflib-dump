<cffunction name="queryTranspose" returntype="query">
	<cfargument name="inputQuery" type="query" required="true">
	<cfargument name="includeHeaders" type="boolean" default="true" required="false">
		
	<cfset var outputQuery = QueryNew("")>
	<cfset var columnsList = inputQuery.ColumnList>
	<cfset var newColumn = ArrayNew(1)>
	<cfset var row = 1>
	<cfset var zeroString = "000000">
	<cfset var padFactor = int(log10(inputQuery.recordcount)) + 1 >
	<cfset var i = "">
		
	<cfif includeHeaders>
		<cfset queryAddColumn(OutputQuery,"col_#right(zeroString & row, padFactor)#",listToArray(ColumnsList))>
		<cfset row = row + 1>
	</cfif>	

	<cfloop query="inputQuery">
		<cfloop index="i" from="1" to="#listlen(columnsList)#">
			<cfset newColumn[i] = inputQuery[ListGetAt(columnsList, i)][currentRow]>
		</cfloop>
		<cfset queryAddColumn(outputQuery,"col_#right(zeroString & row, padFactor)#",newColumn)>
		<cfset row = row + 1>
	</cfloop>
	
	<cfreturn outputQuery>
</cffunction>