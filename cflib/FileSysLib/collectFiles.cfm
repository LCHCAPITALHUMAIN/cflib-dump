<cffunction name="collectFiles" access="public" hint="recurses through a directory and collects the file types you want then outputs to another directory" returnType="void">
	<cfargument name="extensions" required="true" type="string" hint="The extensions you want to gather up csv (list) format ex:(asp,cfm,jsp) ">
	<cfargument name="destinationPath" required="true" type="string" hint="absolute path to storage directory">
	<cfargument name="sourcePath" required="true" type="string" hint="absolute path to source directory">
	<cfset var root = arguments.sourcePath/>
	<cfset var i = "">
	<cfset var absPath = "">
	<cfset var relativePath = "">
	<cfset var writeTo = "">
	<cfset var pathAndFile = "">
	
	<cfif not directoryExists(arguments.sourcePath)>
		<cfthrow message="Source Directory (#arguments.sourcePath#) not found" detail="You didn't pass in a valid source directory, check the path and try again.">
	</cfif>
	
	<cfloop list="#arguments.extensions#" index="i">
		
		<cfdirectory name="getFiles" directory="#root#" recurse="true" filter="*.#i#">
	
			<cfloop query="getFiles">
				
				<cfset absPath = getFiles.directory & "/" />
				
				<cfset relativePath = Replace(absPath, root, "", "all") />
				
				<cfset writeTo = ARGUMENTS.destinationPath & "/" & relativePath>
				
				<cfset pathAndFile = getFiles.directory & "/" & getFiles.name />
				
				<cfif not directoryExists(writeTo)>
					<cfdirectory action="create" directory="#writeTo#">
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				<cfelse>
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				</cfif>
				
			</cfloop>
			
	</cfloop>

</cffunction>