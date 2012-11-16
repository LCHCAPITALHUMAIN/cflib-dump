<cffunction name="IsSQLServerDate" returntype="boolean" output="false">
    <cfargument name="date" type="date" required="true"/>
    <cfargument name="type" type="string" required="false" default="datetime"/>

    <cfswitch expression="#arguments.type#">
        <cfcase value="datetime">
            <cfreturn IsDate(arguments.date) AND Year(arguments.date) gte 1753 />
        </cfcase>
        <cfcase value="smalldatetime">
            <cfreturn IsDate(arguments.date) AND DateCompare(arguments.date, '1/1/1900') gte 0 AND DateCompare(arguments.date, '6/2/2079') lte 0 />
        </cfcase>
    </cfswitch>
</cffunction>