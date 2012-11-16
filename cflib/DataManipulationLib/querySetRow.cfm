<cffunction name="querySetRow" returntype="void" output="false">
	<cfargument name="query" type="query" required="true" />
	<cfargument name="columnList" type="string" required="true" />
	<cfargument name="valuesList" type="string" required="true" />
	<cfargument name="rowNumber" type="numeric" required="false" default="0" />
	<cfargument name="delimiter" type="string" required="false"  default="," />
	<cfargument name="trimElements" type="boolean" required="false"  default="true" />
	
	<cfset var i 	   	= 0>
	<cfset var col	   	= "">
	<cfset var value	= "">
	
	<cfif arguments.rowNumber gt 0 and arguments.rowNumber gt arguments.query.recordCount>
		<cfthrow type="InvalidArgument" message="Invalid rowNumber [#arguments.rowNumber#]. The specified query contains [#arguments.query.RecordCount#] records.">
	</cfif>	
	<cfif ListLen(arguments.columnList, arguments.delimiter) NEQ ListLen(arguments.valuesList, arguments.delimiter)>
		<cfthrow type="InvalidArgument" message="[columnList] and [valuesList] do not contain the same number of elements.">
	</cfif>	
	
	<cfscript>
		//by default, append new row to end of query
		if (val(arguments.rowNumber) lt 1) {
			QueryAddRow(arguments.query, 1);
			rowNumber = arguments.query.recordCount;
		}
		
		//set values for each column
		for (i = 1; i lte ListLen(arguments.columnList, arguments.delimiter); i = i + 1) {
			if (arguments.trimElements) {	
				col   = Trim(ListGetAt(arguments.columnList, i, arguments.delimiter));	
				value = Trim(ListGetAt(arguments.valuesList, i, arguments.delimiter));	
			}
			else {
				col   = ListGetAt(arguments.columnList, i, arguments.delimiter);	
				value = ListGetAt(arguments.valuesList, i, arguments.delimiter);	
			}
		    query[col][arguments.rowNumber] = value;
		}
	</cfscript>
</cffunction>