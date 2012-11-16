<cffunction name="queryCompare" returntype="struct" output="false">
	<cfargument name="query1" type="query" required="true" />
	<cfargument name="query2" type="query" required="true" />
	
	<cfset var rStruct = StructNew()>
	<cfset var q1 = arguments.query1>
	<cfset var q2 = arguments.query2>
	<cfset var q3 = QueryNew( q1.columnlist )>
	<cfset var q4 = QueryNew( q2.columnlist )>
	<cfset var message = "">
	<cfset var rowch = false>
	<cfset var colArray = listtoarray(q1.columnlist)>
	<cfset var thisCol = "">
	<cfset var count = 1>
	<cfset var i = "">
	<cfset var j = "">
	
	<cfloop from="1" to="#listlen(q1.columnlist)#" index="thisCol">
		<cfif listfindnocase(q2.columnlist,listgetat(q1.columnlist,thisCol)) eq 0>
			<cfset message = "Columns in query1 (#q1.columnlist#) and query2 (#q2.columnlist#) doesn't match">
		</cfif>
	</cfloop>
	<cfif not len(trim(message))>
		<cfloop from="1" to="#listlen(q2.columnlist)#" index="thisCol">
			<cfif listfindnocase(q1.columnlist,listgetat(q2.columnlist,thisCol)) eq 0>
				<cfset message = "Columns in query1 (#q1.columnlist#) and query2 (#q2.columnlist#) doesn't match">
			</cfif>
		</cfloop>
	</cfif> 
	
	<cfif not len(trim(message))>
		<cfloop from="1" to="#q1.recordcount#" index="i">
			<cfset rowch = false>
			<cfloop from="1" to="#arraylen(colArray)#" index="j">
				<cfif comparenocase(q1[colArray[j]][i],q2[colArray[j]][i])>
					<cfset rowch = true>
				</cfif>
			</cfloop>
			<cfif rowch>
				<cfset queryaddrow(q3)>
				<cfloop from="1" to="#arraylen(colArray)#" index="k">
					<cfset querysetcell( q3, colArray[k], q1[colArray[k]][count] )>
				</cfloop>
			</cfif>
			<cfset count = count + 1>
		</cfloop>
		<cfset count = 1>
		<cfloop from="1" to="#q2.recordcount#" index="i">
			<cfset rowch = false>
			<cfloop from="1" to="#arraylen(colArray)#" index="j">
				<cfif comparenocase(q1[colArray[j]][i],q2[colArray[j]][i])>
					<cfset rowch = true>
				</cfif>
			</cfloop>
			<cfif rowch>
				<cfset queryaddrow(q4)>
				<cfloop from="1" to="#arraylen(colArray)#" index="k">
					<cfset querysetcell( q4, colArray[k], q2[colArray[k]][count] )>
				</cfloop>
			</cfif>
			<cfset count = count + 1>
		</cfloop>
		<cfif q4.recordcount OR q3.recordcount>
			<cfset message = "Records do not match">
		</cfif>
	</cfif>
	<cfif len(trim(message))>
		<cfset structinsert(rStruct,"message",message)>
		<cfset structinsert(rStruct,"in_query1_butnotin_query2",q3)>
		<cfset structinsert(rStruct,"in_query2_butnotin_query1",q4)>
	<cfelse>
		<cfset structinsert(rStruct,"message","Query 1 and Query 2 are identical")>
	</cfif>
	<cfreturn rStruct />
</cffunction>