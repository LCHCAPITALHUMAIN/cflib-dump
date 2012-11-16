<cffunction name="TrimZero" output="false" returnType="string">
	<cfargument name="varToTrim" type="numeric">
	
	<cfreturn arguments.varToTrim + 0>
</cffunction>