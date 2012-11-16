<cffunction name="queryToTableDump" access="public" returntype="string" output="false">
	<cfargument name="queryData" type="query" required="true" />
	<cfset var theQuery = arguments.queryData>
	<cfset var columns = arraytolist(theQuery.getMeta().getColumnLabels())>
	<cfset var theResults = "">
	<cfset var c = "">
	<cfset var i = "">
	<cfsavecontent variable="theResults">
		<cfoutput>
			<table border="1" cellpadding="0" cellspacing="0" align="left">
			<tr>
			<cfloop list="#columns#" index="c">
				<th>#c#</th>
			</cfloop>
			</tr>
			<cfloop from="1" to="#theQuery.recordCount#" index="i">
				<tr><cfloop list="#columns#" index="c">
					<td><cfif len(theQuery[c][i])>#theQuery[c][i]#<cfelse> </cfif></td></cfloop>
				</tr>
			</cfloop>
			</table>
		</cfoutput>
	</cfsavecontent>
	<cfreturn theResults />
</cffunction>