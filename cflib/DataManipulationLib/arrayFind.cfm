<cffunction name="arrayFind" access="public" hint="returns the index number of an item if it is in the array" output="false" returntype="numeric">

<cfargument name="array" required="true" type="array">
<cfargument name="valueToFind" required="true" type="string">

<cfreturn (arguments.array.indexOf(arguments.valueToFind)) + 1>
</cffunction>