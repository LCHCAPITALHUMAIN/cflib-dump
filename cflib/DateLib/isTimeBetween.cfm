<cffunction name="isTimeBetween" access="public" returntype="boolean" output="false">
    <cfargument name="minTime" type="date" required="true">
    <cfargument name="maxTime" type="date" required="true">
	<cfargument name="time" type="date" required="false" default="#now()#">
	
    <cfset var curTime = createTime(timeFormat(arguments.time,"H"),timeFormat(arguments.time,"mm"),timeFormat(arguments.time,"ss"))>
    <cfif dateDiff("n",minTime,curTime) gt 0 and
          dateDiff("n",maxTime,curTime) lt 0>
        <cfreturn true>
    <cfelse>
        <cfreturn false>
    </cfif> 
       
</cffunction>