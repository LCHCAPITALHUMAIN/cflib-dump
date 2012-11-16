<cffunction name="wddxDeserialize" output="false" returnType="any">
	<cfargument name="input" type="string" required="true">

	<cfset var output="">
	
	<cfwddx action="wddx2cfml" input="#input#" output="output">
	<cfreturn output>
</cffunction>