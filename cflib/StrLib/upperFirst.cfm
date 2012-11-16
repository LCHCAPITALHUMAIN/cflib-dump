<cffunction name="upperFirst" access="public" returntype="string" output="false" hint="I convert the first letter of a string to upper case, while leaving the rest of the string alone.">
		<cfargument name="name" type="string" required="true">
		<cfreturn uCase(left(arguments.name,1)) & right(arguments.name,len(arguments.name)-1)>
</cffunction>