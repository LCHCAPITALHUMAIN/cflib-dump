<cffunction name="byteAutoConvert" access="public" returntype="string" output="false">
	<cfargument name="bytes" type="numeric" required="true">
	<cfargument name="maxreduction" type="numeric" required="false" default="9">
	<cfset var units = listToArray("B,KB,MB,GB,TB,PB,EB,ZB,YB",",")>> 
	<cfset var conv = 0>
	<cfset var exp = 0>
	
	<cfif arguments.maxreduction gte 9>
		<cfset arguments.maxreduction = arraylen(units) - 1>
	</cfif>
	
	<cfif arguments.bytes gt 0>
		<cfset exp = fix(log(arguments.bytes) / log(1024))>
		<cfif exp gt arguments.maxreduction>
			<cfset exp = arguments.maxreduction>
		</cfif>
		<cfset conv = arguments.bytes / (1024^exp)>
	</cfif>
			
	<cfreturn "#trim(lsnumberformat(conv,"_____.00"))# #units[exp + 1]#"/>
</cffunction>