<cffunction name="isCachedQuery" returntype="boolean" output="false">
	<cfargument name="queryname" required="true" type="string" />
	
	<cfset var events = "">
	<cfset var result = false>	
	<cfset var temp = "">
	
	<cfif isdebugmode()>
		<cfset events = createobject('java','coldfusion.server.ServiceFactory').getDebuggingService().getDebugger().getData()>
		<cfquery name="temp" dbtype="query">
			select	cachedquery
			from	events
			WHERE 	type='SqlQuery' 
					and name='#arguments.queryname#'
		</cfquery>
		<cfset result = yesnoformat(temp.cachedquery)>
	</cfif>

	<cfreturn result />
</cffunction>