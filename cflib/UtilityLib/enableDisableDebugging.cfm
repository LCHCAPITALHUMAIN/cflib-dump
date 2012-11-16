<cffunction name="enableDisableDebugging" output="false" returntype="void" hint="I enable/disable debugging settings">
	<cfargument name="what" type="string" required="true" />	
	<cfset var db_service = createobject("java","coldfusion.server.ServiceFactory").getDebuggingService()>
	
	<cfif arguments.what eq "enable">
		<cfif not db_service.isEnabled()>
			<cfset db_service.setEnabled(true)>
		</cfif>
	<cfelseif arguments.what eq "disable">
		<cfif db_service.isEnabled()>
			<cfset db_service.setEnabled(false)>
		</cfif>
	</cfif>
</cffunction>