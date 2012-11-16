<cffunction name="enableDisableWhiteSpaceManagement" output="false" returntype="boolean">
	<cfargument name="action" type="string" default="enable" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var runtime = "";
		
	</cfscript>
	<cflock name="factory_runtimeservice" type="exclusive" timeout="5">
		<cfset runtime = factory.getRuntimeService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="enable">
				<cfif not runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("YES")>
				</cfif>
			</cfcase>
			<cfcase value="disable">
				<cfif runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("NO")>
				</cfif>
			</cfcase>
		</cfswitch>
	</cflock>
	<cfreturn runtime.WhiteSpace />
</cffunction>