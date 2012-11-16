<cffunction name="getSkypeStatus" access="" returntype="any" output="false" 
			  hint="Call the skype website to know the status of a user">
	<cfargument name="userName" type="string" required="true" hint="The Skype username to check">
	<cfargument name="numeric" type="boolean" required="false" default="false" hint="Return the numeric status (default is textual)">	
	<cfargument name="timeOut" type="numeric" required="false" default="20" hint="Timeout while asking the skype service">	

	<cfset var cfhttp = "">
	<cfhttp url="http://mystatus.skype.com/#userName#.#IIF(numeric,DE('num'),DE('txt'))#" timeout="#timeout#">
	<cfreturn cfhttp.fileContent>
</cffunction>