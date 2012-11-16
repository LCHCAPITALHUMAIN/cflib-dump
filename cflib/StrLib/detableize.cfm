<cffunction name="detableize">
	<cfargument name="string" type="string" required="true" />
	<cfset var outputString = arguments["string"]>
	<cfset outputString = reReplaceNoCase(outputString , "</*table>", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "</*t[rhd](\s*\w*=*""*\w*""*)*>", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "(?m)^\s*", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "\n{2,}", "#chr(10)#", "all")>
	<cfreturn outputString />
</cffunction>