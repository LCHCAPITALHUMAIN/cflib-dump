<cffunction name="fakesleep" access="public" returntype="void" output="false">
	<cfargument name="timeToSleep" type="numeric" required="true" hint="the number of miliseconds you wish to sleep for." />

	<cfset var bContinue 	= false />	
	<cfset var startTime 	= getTickCount() />
	<cfset var endTime 		= 0 />
	<cfset var elapsedTime  = 0 />

	<cfloop condition="NOT bContinue">
		<cfset endTime 		= getTickCount() />
		<cfset elapsedTime  = endTime - startTime />
		
		<cfif elapsedTime gte arguments.timeToSleep>
			<cfset bContinue = true />
		</cfif>
	</cfloop>
	
</cffunction>