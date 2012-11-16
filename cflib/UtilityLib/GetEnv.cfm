<cffunction name="GetEnv" output="false" returnType="any">
	<cfargument name="varname" type="string" required="no">
	
	<!--- Define local variables --->
	<cfset var env=structNew()>
	<cfset var data="">
	<cfset var ename="">
	<cfset var evalue="">
	<cfset var i = 1>
	
	<!--- Get enviroment and save to variable --->
	<cfsavecontent variable="data">
		<cfexecute name="cmd /c set" timeout="1" />
	</cfsavecontent>

	<!--- Need to convert to structure, so loop through --->
	<cfloop index="i" list="#trim(data)#" delimiters="#chr(10)##chr(13)#">
		<!--- For each line, get name and value --->
		<cfset ename=trim(listfirst(i, "="))>
		<cfset evalue=trim(listrest(i, "="))>
		<!--- And add to structure --->
		<cfset env[ename] = evalue>
	</CFLOOP>

	<!--- And finally, build return value --->
	<cfif not isDefined("varname")>
		<!--- If no name, return list --->
		<cfreturn env>
	<cfelseif structKeyExists(env, varname)>
		<!--- If name provided, and present, get value --->
		<cfreturn env[varname]>
	</cfif>

</cffunction>