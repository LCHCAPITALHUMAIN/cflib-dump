<cffunction name="getGeneratedKey" hint="i normalize the key returned from cfquery" output="false">
	<cfargument name="resultStruct" hint="the result struct returned from cfquery" />
	<cfif structKeyExists(arguments.resultStruct, "IDENTITYCOL")>
		<cfreturn arguments.resultStruct.IDENTITYCOL />
	<cfelseif structKeyExists(arguments.resultStruct, "ROWID")>
		<cfreturn arguments.resultStruct.ROWID />
	<cfelseif structKeyExists(arguments.resultStruct, "SYB_IDENTITY")>
		<cfreturn arguments.resultStruct.SYB_IDENTITY />
	<cfelseif structKeyExists(arguments.resultStruct, "SERIAL_COL")>
		<cfreturn arguments.resultStruct.SERIAL_COL />	
	<cfelseif structKeyExists(arguments.resultStruct, "GENERATED_KEY")>
		<cfreturn arguments.resultStruct.GENERATED_KEY />
	<cfelse>
		<cfreturn />
	</cfif>
</cffunction>