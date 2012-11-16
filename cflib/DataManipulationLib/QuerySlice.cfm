<cffunction name="QuerySliceAndDice" returntype="query" output="false">
	<cfargument name="theQuery" type="query" required="true" />
	<cfargument name="StartRow" type="numeric" required="true" />
	<cfargument name="NumberOfRows" type="numeric" required="true" />
	<cfargument name="ColumnList" type="string" required="false" default="" />
	
	<cfscript>
		var FinalQuery = "";
		var EndRow = StartRow + NumberOfRows;
		var counter = 1;
		var x = "";
		var y = "";
	
		if (arguments.ColumnList IS "") {
			arguments.ColumnList = theQuery.ColumnList;
		}
		FinalQuery = QueryNew(arguments.ColumnList);
			
		if(EndRow GT theQuery.recordcount) {
			EndRow = theQuery.recordcount+1;
		}
		
		QueryAddRow(FinalQuery,EndRow - StartRow);
		
		for(x = 1; x LTE theQuery.recordcount; x = x + 1){
			if(x GTE StartRow AND x LT EndRow) {
				for(y = 1; y LTE ListLen(arguments.ColumnList); y = y + 1) {
					QuerySetCell(FinalQuery, ListGetAt(arguments.ColumnList, y), theQuery[ListGetAt(arguments.ColumnList, y)][x],counter);
				}
				counter = counter + 1;
			}
		}
			
		return FinalQuery;
	</cfscript>
	
</cffunction>