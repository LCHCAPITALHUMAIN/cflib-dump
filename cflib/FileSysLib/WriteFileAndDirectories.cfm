<cffunction name="WriteFileAndDirectories" output="false" returnType="void">
	<cfargument name="fileAndPath"      type="string"   required="true">
	<cfargument name="fileOutput"       type="string"   required="true">
	<cfargument name="fileAndPathMode"  type="string"   required="false"  default="">
	<cfargument name="fileAddNewLine"   type="boolean"  required="false"  default="yes">
	<cfargument name="fileAttributes"   type="string"   required="false"  default="">

	<cfset var path_array     = ListToArray(fileAndPath, "\")>
	<cfset var this_dir_path  = path_array[1]>   <!--- first item in fileAndPath is the drive path --->
	<cfset var file_name      = path_array[ArrayLen(path_array)]>   <!--- last item in fileAndPath is the file name --->
	<cfset var second_last    = ArrayLen(path_array)-1>

	<cfset var i = 0>

	<!--- lock these directories and files to prevent errors with concurrent threads --->
	<cflock timeout="30" throwontimeout="Yes" name="WriteFileAndDirectoriesLock" type="EXCLUSIVE">

		<!--- create any missing directories --->
		<cfloop index="i" from="2" to="#second_last#">
			<cfset this_dir_path = this_dir_path & "\" &  path_array[i]>
			<cfif not DirectoryExists(this_dir_path)>
				<cfif fileAndPathMode is "">
					<cfdirectory action="CREATE" directory="#this_dir_path#">
				<cfelse>
					<cfdirectory action="CREATE" directory="#this_dir_path#" mode="#fileAndPathMode#">
				</cfif>
			</cfif>
		</cfloop>

		<!--- write the file to the now confirmed/created directory path --->
		<cfif fileAndPathMode is "">
			<cffile action="WRITE" file="#fileAndPath#" output="#fileOutput#" addNewLine="#fileAddNewLine#" attributes="#fileAttributes#">
		<cfelse>
			<cffile action="WRITE" file="#fileAndPath#" output="#fileOutput#" mode="#fileAndPathMode#" addNewLine="#fileAddNewLine#" attributes="#fileAttributes#">
		</cfif>
	</cflock>

</cffunction>