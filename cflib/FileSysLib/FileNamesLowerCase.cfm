<cffunction name="fileNamesLowerCase" output="no" returnType="void">
	<!--- the directory to lower case the files in --->
	<cfargument name="directory" required="yes" type="string">
	<!--- shall we recurse down the directory tree?  By default, no. --->
	<cfargument name="recurseDirectories" required="no" default="FALSE" type="boolean">
	<!--- list of files to exclude --->
	<cfargument name="excludeList" required="no" type="string" default="">
	<!--- a variable to hold the directoryList --->
	<cfset var directoryList = "">
	<!--- by default, use a Windows style slash --->
	<cfset var slash = "\">
	<!--- make sure this directory exists --->
	<cfif NOT directoryExists(arguments.directory)>
		<cfthrow message="Directory does not exist" detail="The directory path #arguments.directory# does not exist">
	</cfif>
	<!--- if this not windows, use a *nix style slash --->
	<cfif server.os.name DOES NOT CONTAIN "Windows">
		<cfset slash = "/">
	</cfif>
	<!--- now make sure the directory path ends in a slash --->
	<cfif right(arguments.directory,1) IS NOT slash>
		<cfset arguments.directory = arguments.directory & slash>
	</cfif>
	<!--- read the contents of this directory --->
	<cfdirectory action="list" directory="#arguments.directory#" name="directoryList">
	<!--- loop through the contents of this directory, making it lower case --->
	<cfloop query="directoryList">
		<!--- if this is a file, rename it to whatever it is, lower-cased --->
		<cfif NOT compare(type,"File") AND NOT listFindNoCase(arguments.excludeList,name)>
			<cffile action="rename" source="#arguments.directory##name#" destination="#arguments.directory##lcase(name)#">
		<!--- if this a directory, and we are recursing, call this function again --->
		<cfelseif NOT compare(type,"Dir") AND arguments.recurseDirectories>
			<cfset fileNamesLowerCase(arguments.directory & name,1,arguments.excludeList)>
		</cfif>
	</cfloop>
</cffunction>