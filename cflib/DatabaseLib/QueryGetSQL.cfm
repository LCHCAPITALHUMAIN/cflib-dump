<CFFUNCTION NAME="QueryGetSQL" RETURNTYPE="string">

	<!--- Query name is required --->
	<CFARGUMENT NAME="queryname" TYPE="string" REQUIRED="yes">

        <!--- Initialize variables --->
        <CFSET var cfdebugger="">
        <CFSET var events ="">
        
	<!--- Initialize result string --->
	<CFSET var result="">

	<!--- Requires debug mode --->
	<CFIF IsDebugMode()>

		<!--- Use debugging service --->
		<CFOBJECT ACTION="CREATE"
		          TYPE="JAVA"

CLASS="coldfusion.server.ServiceFactory"
				  NAME="factory">
		<CFSET cfdebugger=factory.getDebuggingService()>

		<!--- Load the debugging service's event table --->
		<CFSET events = cfdebugger.getDebugger().getData()>

		<!--- Get SQL statement (body) for specified query --->
		<CFQUERY DBTYPE="query" NAME="getquery" DEBUG="false">
		SELECT body
		FROM events
		WHERE type='SqlQuery' AND name='#queryname#'
		</CFQUERY>

		<!--- Save result --->
		<CFSET result=getquery.body>
	</CFIF>

	<!--- Return string --->
	<CFRETURN result>
</CFFUNCTION>