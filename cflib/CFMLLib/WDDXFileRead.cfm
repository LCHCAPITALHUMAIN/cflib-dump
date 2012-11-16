<cffunction name="WDDXFileRead" output="no">
	<cfargument name="file" required="yes">
	
	<cfset var tempPacket = "">
	<cfset var tempVar = "">
	
	<!--- make sure the file exists, otherwise, throw an error --->
	<cfif NOT fileExists(file)>
		<cfthrow message="WDDXFileRead() error: File Does Not Exist" detail="The file #file# called in WDDXFileRead() does not exist">
	</cfif>
	<!--- read the file --->
	<cffile action="read" file="#file#" variable="tempPacket">
	<!--- make sure it is a valid WDDX Packet --->
	<cfif NOT isWDDX(tempPacket)>
		<cfthrow message="WDDXFileRead() error: Bad Packet" detail="The file #file# called in WDDXFileRead() does not contain a valid WDDX packet">		
	</cfif>
	<!--- deserialize --->
	<cfwddx action="wddx2cfml" input="#tempPacket#" output="tempVar">
	<cfreturn tempVar>    
</cffunction>