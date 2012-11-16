<cffunction name="filterFilename" access="public" returntype="string" output="false" hint="I remove any special characters from a filename and replace any spaces with underscores.">
	<cfargument name="filename" type="string" required="true" />
	<cfset var filenameRE = "[" & "'" & '"' & "##" & "/\\%&`@~!,:;=<>\+\*\?\[\]\^\$\(\)\{\}\|]" />
	<cfset var newfilename = reReplace(arguments.filename,filenameRE,"","all") />
	<cfset newfilename = replace(newfilename," ","_","all") />
	
	<cfreturn newfilename /> 
</cffunction>