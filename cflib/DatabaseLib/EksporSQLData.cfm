<cffunction name="EkporSQLTable" returnType="string" output="false">
	<cfargument name="table" type="string" required="true">
    <cfargument name="dbsource" type="string" required="true">
	<cfset var theTable = "#arguments.table#">
    <cfset var theFileContent = ""><!--- to save the content SQL to a file --->		
    <cfset var theFields = "">
    <cfset var theSQL = "">
    <cfset var theFIELD = "">
    <cfset var theVALUE = "">
    <cfset var kolom = "">
    <cfset var theDate = "">
    <cfset var tables = "">
    <cfset var i = "">
    <cfset var qRead = "">
    	
    <cfloop list="#theTable#" index="tables" delimiters=",">
        <cfquery name="qRead" datasource="#arguments.dbsource#" debug="no">
            select * from #tables#
        </cfquery>    
        <cfif qRead.recordCount gt 0>
            <cfset theFields = getMetaData(qRead)>	
            <cfloop query="qRead">
                <cfset theSQL = "">
                <cfset theFIELD = "INSERT INTO #tables#_temp (">
                <cfset theVALUE = "VALUES ( ">
                <!--- THE KOLOM N VALUE --------------------------------------------------------------------------------->	
                <cfloop index="i" from="1" to="#arrayLen(theFields) -1#">
                    <cfset kolom = evaluate("qRead.#theFields[i].name#")>
                    <cfset theFIELD = theFIELD & " " & theFields[i].name & ",">                
                    <!--- CHECK THE TYPE -------------------------------------------------------------------------------->
                    <cfswitch expression="#theFields[i].TypeName#">
                        <cfcase value="number">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="numeric">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="float">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="integer">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="text">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>							
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="varchar">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="char">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="varchar2">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="date">
                            <!--- format TO MYSQL --->
                            <cfif kolom neq "">
                                <cfset theDate = dateformat(kolom, "yyyy-mm-dd")>								
                                <cfset theVALUE = theVALUE & " '" & theDate & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfdefaultcase>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfdefaultcase>
                    </cfswitch>
                </cfloop>
                <cfset kolom = evaluate("qRead.#theFields[i].name#")>
                <cfset theFIELD = theFIELD & " " & theFields[i].name & ")">
                <!--- CHECK THE TYPE -------------------------------------------------------------------------------->
                <cfswitch expression="#theFields[i].TypeName#">
                    <cfcase value="number">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="numeric">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="float">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="integer">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="text">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="varchar">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="char">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="varchar2">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="date">
                        <!--- format TO MYSQL --->
                        <cfif kolom neq "">
                            <cfset theDate = dateformat(kolom, "yyyy-mm-dd")>								
                            <cfset theVALUE = theVALUE & " '" & theDate & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfdefaultcase>
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfdefaultcase>
                </cfswitch>		
                <cfset theSQL = theSQL & "" & theFIELD & " " & theVALUE>						
                <cfif theFileContent neq "">
                    <cfset theFileContent = theFileContent &";<br>"& theSQL>
                <cfelse>
                    <cfset theFileContent = theFileContent &""& theSQL>
                </cfif>
            </cfloop>
        </cfif>
    </cfloop>
    <cfreturn theFileContent>
</cffunction>