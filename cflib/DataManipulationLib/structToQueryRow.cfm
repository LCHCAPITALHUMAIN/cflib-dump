<cffunction name="structToQueryRow" output="false" access="public" returntype="query">
	<cfargument name="query" required="true" type="query" />
	<cfargument name="struct" required="true" type="struct" />
	<cfset var item = "" />
	<cfset var returnQ = arguments.query />

	<cfset queryAddRow(arguments.query) />
	
	<cfloop collection="#arguments.struct#" item="item">
		<cfif listFindNoCase(returnQ.columnList,item)>
			<cfset querySetCell(returnQ,item,arguments.struct[item]) />
		</cfif>
	</cfloop>
	
	<cfreturn returnQ />
</cffunction>