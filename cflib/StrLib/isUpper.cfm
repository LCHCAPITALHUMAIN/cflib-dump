<cffunction name="isUpper" output="false" returntype="boolean">
	<cfargument name="str" type="string" required="true" />
	<cfreturn compare(arguments.str,uCase(arguments.str)) is 0>
</cffunction>