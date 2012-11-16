<cffunction name="getCfDateTimeFromW3DateTime" access="public" returntype="string" output="false">
    <cfargument name="dts" type="string" required="true" />
    <cfif left(dts,1) is "(">
        <cfset dts = mid(dts,2,len(dts)-2)>
    </cfif>
    <cfset dts = listToArray(reReplace(dts,"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(\D)?(\d{2})?(:00)?","\2/\3/\1 \4:\5:\6;\7;\8"),";")>
    <cfif arrayLen(dts) IS 2>
        <cfreturn createDateTime(year(dts[1]),month(dts[1]),day(dts[1]),hour(dts[1]),minute(dts[1]),second(dts[1])) />
    <cfelse>
        <cfif dts[2] is "-">
            <cfreturn dateAdd("h",0-listFirst(dts[3],":"),dts[1]) />
        <cfelse>
            <cfreturn dateAdd("h",listFirst(dts[3],":"),dts[1]) />
        </cfif>
    </cfif>
</cffunction>