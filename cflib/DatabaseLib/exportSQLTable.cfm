<cffunction name="exportSQLTable" returnType="string" output="false">
        <cfargument name="table" type="string" required="true">
        <cfargument name="dbsource" type="string" required="true">
        <cfargument name="dbuser" type="string" required="false" default="">
        <cfargument name="dbpassword" type="string" required="false" default="">
        <cfargument name="commitAfter" default="100" type="numeric">

        <cfset var i = 1>
        <cfset var j = 1>
        <cfset var k = 0>
        <cfset var temp = "">
        <cfset var qryTemp = "">
        <cfset var tempCol = "">
        <cfset var str = "">
        <cfset var textstr = "">

        <!--- Getting table data --->
        <cfquery name="qryTemp" datasource="#arguments.dbsource#" username= "#arguments.dbuser#" password="#arguments.dbpassword#">
                select * from #arguments.table#
        </cfquery>

        <!--- Getting meta information of executed query --->
        <cfset tempCol = getMetaData(qryTemp)>
        <cfset k =      ArrayLen(tempCol) >

        <cfloop query="qryTemp">
                <cfset temp = "INSERT INTO " & arguments.table &" (">
                <cfloop index="j" from="1" to="#k#">
                        <cfset temp = temp & "[#tempCol[j].Name#]" >
                 <cfif j NEQ k >
                        <cfset temp = temp & "," >
                 </cfif>
                </cfloop>


                <cfset temp = temp & ") VALUES (">
                <cfloop index="j" from="1" to="#k#">
                        <cfif FindNoCase("char", tempCol[j].TypeName)
                              OR FindNoCase("date", tempCol[j].TypeName)
                                  OR FindNoCase("text", tempCol[j].TypeName)
                                  OR FindNoCase("unique", tempCol[j].TypeName)
                                  OR FindNoCase("xml", tempCol[j].TypeName)
                                   >
                                <cfset textstr = qryTemp[tempCol[j].Name][i] >
                                <cfif Find("'",textstr)>
                                  <cfset textstr = Replace(textstr,"'","'","ALL") >
                                </cfif>
                                <cfset temp = temp & "'" & textstr & "'" >
                        <cfelseif FindNoCase("image",tempCol[j].TypeName)>
                                 <cfset temp = temp & "'" >
                        <cfelse>
                                <cfset temp = temp & qryTemp[#tempCol[j].Name#][i] >
                        </cfif>
                  <cfif j NEQ k >
                        <cfset temp = temp  &  "," >
                 </cfif>

                </cfloop>
                <cfset temp = temp & ");">
                <cfset str = str & temp & chr(10)>
                <cfif i mod commitAfter EQ 0>
                        <cfset str = str & "commit;" & chr(10)>
                </cfif>
                <cfset i = i + 1>
        </cfloop>
        <cfreturn str>
</cffunction>