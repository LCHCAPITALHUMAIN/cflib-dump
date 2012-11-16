<cffunction name="cfMailFactory" access="public" returntype="string" output=false>
	<cfargument name="mailaction" type="string" required="true"/>
	<cfset var mailItem = "">
	<cfset var factory = "">
	<cfset var mm_service = "">
	<cfset var mm_settings = "">
			
	<!--- Access CF Service Factory --->
	<cfobject action="create" type="java" class="coldfusion.server.ServiceFactory" name="factory"/>

	<!--- Begin Action Checks --->
	<cfswitch expression="#trim(arguments.mailaction)#">

		<cfcase value="isSpoolEnable">
			<cfset mailItem = factory.mailSpoolService.isSpoolEnable()>
		</cfcase>

		<cfcase value="resetSpool">
		
			<cflock name="serviceFactory" type="exclusive" timeout="10">
			<cfscript>
			ms_service = factory.mailspoolservice;
			ms_settings = ms_service.settings;
			</cfscript>
			</cflock>
			
			<cfset mailItem = "Reset Successfull">
		</cfcase>

 		<cfcase value="getServer">
	      <cfset mailItem = factory.mailSpoolService.getServer()>
	    </cfcase>

	    <cfdefaultcase>
	    	<cfthrow message="Invalid mail action passed. Must be resetSpool, getServer, or isSpoolEnable.">
	    </cfdefaultcase>

	 </cfswitch>

	<cfreturn mailItem />

</cffunction>