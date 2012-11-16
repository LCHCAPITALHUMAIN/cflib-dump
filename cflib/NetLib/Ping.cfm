<cffunction name="Ping" returntype="string" output="false" access="public">
    <cfargument name="host" type="string" required="yes">
    <!--- Local vars --->
    <cfset var pingClass="">
    <cfset var pingReply="">
    <!--- Get Ping class --->
    <cfobject type=".NET" name="pingClass"
            class="System.Net.NetworkInformation.Ping">
    <!--- Perform synchronous ping (using defaults) ---> 
    <cfset pingReply=pingClass.Send(Arguments.host)>
    <!--- Return result --->
    <cfreturn pingReply.Get_Status().ToString()>
</cffunction>