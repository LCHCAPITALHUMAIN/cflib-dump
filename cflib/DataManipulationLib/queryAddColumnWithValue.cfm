<cffunction name="queryAddColumnWithValue" returntype="boolean" output="false">
	<cfargument name="query" type="query" required="true" />
	<cfargument name="column_name" type="string" required="true" />
	<cfargument name="value" type="string" required="false" default="" />
	<cfset var arr=arrayNew(1) />
	
	<cfscript>
		arraySet(arr,1,arguments.query.recordCount,arguments.value);
		queryAddColumn(arguments.query, arguments.column_name, arr);
	</cfscript>

	<cfreturn true>
</cffunction>