<cffunction name="GetNISTTime" returntype="struct" output="false">
	<cfargument name="timeServer" type="string" default="192.43.244.18" required="false">
	<cfset var result=StructNew()>

	<!--- Try/catch block --->
	<cftry>

      <!--- Try get time data --->
      <cfhttp url="http://#arguments.timeServer#:13/" />
      <!--- Save raw data --->
      <cfset result.raw = CFHTTP.FileContent>
      <!--- Extract Julian date --->
      <cfset result.julian=ListGetAt(result.raw, 1, " ")>
      <!--- Extract current date and time --->
      <cfset result.now=ParseDateTime(ListGetAt(result.raw, 2, " ")
                              & " "
                              & ListGetAt(result.raw, 3, " "))>
      <!--- Extract daylight savings time flag --->
      <cfset result.dst=IIf(ListGetAt(result.raw, 4, " ") IS 0,
                        FALSE, TRUE)>
      <!--- Extract leap month flag --->
      <cfset result.leapmonth=IIf(ListGetAt(result.raw, 5, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract health flag --->
      <cfset result.healthy=IIf(ListGetAt(result.raw, 6, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract advance milliseconds --->
      <cfset result.msadv=ListGetAt(result.raw, 7, " ")>
      <!--- Success --->
      <cfset result.success=TRUE>

      <!--- Catch any errors --->
      <cfcatch type="any">
         <cfset result.success=FALSE>
      </cfcatch>

	</cftry>

	<cfreturn result>

</cffunction>