<cffunction name="queryh" returnType="query" description="returns query after senitize descriptive fields">
	<cfargument name="query" type="query" required="true">

	<cfset var list = "" />
	<cfset var listSelect = "varchar,char,nvarchar,text,ntext" />
	<cfset var column = "">
	<cfset var metadata = "">
	<cfset var type = "">
	
	<cfloop list="#query.ColumnList#" index="column">
		<cfscript>
		metadata = query.getMetaData();
		type = metadata.getColumnTypeName(query.findColumn(column));
		</cfscript>

		<cfif listFindNoCase(listSelect,type)>
			<cfset list = listAppend(list,column)>
		</cfif>
	</cfloop>
	
	<cfif listLen(list)>
		<cfloop query="query">
			<cfloop list="#list#" index="column">
				<cfset querySetCell(query, column, htmlEditFormat(query[column][currentRow]),currentRow)>
			</cfloop>
		</cfloop>
	</cfif>

	<cfreturn query />
</cffunction>