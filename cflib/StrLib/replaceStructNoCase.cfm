<cffunction name="replaceStructNoCase" returntype="string">
	<cfargument name="argString" type="string" required="true" />
	<cfargument name="argStruct" type="struct" required="true" />
	<cfargument name="argStartSymbol" type="string" required="false" default="{" />
	<cfargument name="argEndSymbol" type="string" required="false" default="}" />
	
	<cfset var result = "" />
	<cfset var i = "" />
	
	<cfset result = arguments.argString />
	
	<cfloop collection="#arguments.argStruct#" item="i">
		<cfset result = replaceNoCase( result, arguments.argStartSymbol & i & arguments.argEndSymbol, StructFind(arguments.argStruct, i), "all" ) />
	</cfloop>
	
	<cfreturn result />
</cffunction>