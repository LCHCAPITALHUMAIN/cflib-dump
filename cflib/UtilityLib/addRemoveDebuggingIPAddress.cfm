<cffunction name="addRemoveDebuggingIPAddress" output="false" returnType="string">
	<cfargument name="IPaddress" type="string" required="Yes" />
	<cfargument name="action" type="string" default="Add" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var debuggingService  ="";
	</cfscript>
	<cflock name="factory_debuggingservice" type="exclusive" timeout="5">
		<cfset debuggingService = factory.getDebuggingService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="Add">
				<cfif not listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListAppend(debuggingService.iplist.ipList,arguments.IPaddress)>
				</cfif>
			</cfcase>
			<cfcase value="Remove">
				<cfif listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListDeleteAt(debuggingService.iplist.ipList,ListFindNoCase(debuggingService.iplist.ipList,arguments.IPaddress))>
				</cfif>
			</cfcase>
		</cfswitch>
		<cfreturn debuggingService.iplist.ipList />
	</cflock>
</cffunction>