<cffunction name="stringHours" returntype="string" output="false">
    <cfargument name="mins" type="numeric" required="true" />
    
    <cfset var retVal = "" />
	<cfset var rawHours = mins/60 />
	
	<!--- Calculate the hours --->
	<cfset var hours = int(rawhours) />	
    <cfif hours is "1">
		<cfset hours = hours & " hour " />
	<cfelse>
		<cfset hours = hours & " hours " />
    </cfif>
    
    <!--- Calculate the minutes --->
    <cfset mins = round((rawHours - int(rawHours)) * 60) />	
    <cfif mins is "1">
		<cfset mins = mins & " min " />
    <cfelse>
		<cfset mins = mins & " mins " />    
    </cfif>
    
    <!--- Add the hours --->
    <cfif left(hours, 1) IS NOT 0>
		<cfset retVal = hours />
    </cfif>
    
    <!--- Now bring them all together --->
    <cfif left(mins, 1) IS NOT 0>
		<cfset retVal = retVal & mins />
	</cfif>
    
    <cfreturn retVal />
</cffunction>