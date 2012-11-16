<cffunction name="qryOrderToTable" returntype="query" hint="Changes horizontal order to vertical in a query to display in a HTML table" output="no">
	<cfargument name="theQuery" type="query" required="yes">
	<cfargument name="tableCols" type="numeric" default="2">
	<cfset var change=ceiling(theQuery.recordCount/tableCols)>
	<cfset var column=0>
	<cfset var newQry=QueryNew("#theQuery.columnList#")>
	<cfset var temp = QueryAddRow(newQry, theQuery.recordCount)>
	<cfset var thisRow=0>
	<cfset var c=0>
	<cfset var newPos=0>
	<cfset var thisCol=0>

	<cfoutput query="theQuery">
		<cfset thisRow=currentRow>
		<cfloop index="c" from="1" to="#tableCols#">
			<cfif currentRow gt (change*c)><cfset column=c><cfset thisRow=currentRow-(change*c)></cfif>
		</cfloop>
		<cfset newPos=thisRow+column+((thisRow-1)*(tableCols-1))>
		<cfloop index="thisCol" list="#theQuery.columnList#">
			<cfset temp = QuerySetCell(newQry, thisCol, evaluate(thisCol), newPos)>
		</cfloop>
	</cfoutput>
	<cfreturn newQry>
</cffunction>