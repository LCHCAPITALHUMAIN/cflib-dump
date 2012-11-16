<cffunction name="getUrlRelativeToWebRoot" access="public" output="true" returntype="string" hint="pass in a web root and file path and get the url relative to the web root">
	<cfargument name="webRootPath" required="yes" type="string" hint="c:\wwwroot\ as an example">
	<cfargument name="filePath" required="yes" type="string" hint="c:\wwwroot\images\my image.gif">
	<cfargument name="encodeURL" required="no" type="boolean" default="false" hint="url encodes all between the slashes and ignores periods">
	<cfset var pathOut="">
	<!--- these two vars only needed if encodeURL is true --->
	<cfset var strPathOut="/">
	<cfset var arrPath=arraynew(1)>
	<cfset var x = "">

	<!--- strip out the web root path and convert the slashes --->
	<cfset pathOut=replace(replacenocase(arguments.filePath,arguments.webRootPath,"/","one"),"\","/","all")>
	<!--- made this an option since URLEncodedFormat() changes everything, including the slashes --->
	<cfif arguments.encodeURL>
		<!--- load the array --->
		<cfset arrPath=listtoarray(pathout,"/")>
		<!--- loop the array (old school for portability) --->
		<cfloop index="x" from="1" to="#arraylen(arrPath)#">
			<!--- encode the string, but change the periods back (personal preference) --->
			<cfset strPathOut=listAppend(strPathOut,replacenocase(urlencodedformat(arrPath[x]),"%2e",".","all"),"/")>
		</cfloop>
		<!--- re-populate the out var --->
		<cfset pathout=strPathOut>
	</cfif>
	<!--- lets make sure we have not duped any slashes to catch listAppend() and/or inconsistent data coming in --->
	<cfset pathout=replacenocase(pathOut,"//","/","all")>
	<cfreturn pathOut>
</cffunction>