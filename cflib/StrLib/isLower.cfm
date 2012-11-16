<cffunction name="isLower" output="false" returntype="boolean">
	<cfargument name="str" type="string" required="true" />
	<cfreturn compare(arguments.str,lCase(arguments.str)) is 0>
</cffunction>