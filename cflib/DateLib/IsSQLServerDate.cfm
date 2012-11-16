<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Validates a string as valid datetime or smalldatetime string for SQL Server.
 * 
 * @param date 	 Date to check (Required)
 * @param type 	 Type - smalldatetime or datetime (Optional)
 * @return returns a boolean 
 * @author Jon Hartmann (jon.hartmann@gmail.com) 
 * @version 0, May 9, 2009 
 */
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
</cfscript>