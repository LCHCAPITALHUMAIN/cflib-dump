<cffunction name="ArrayFindByDimension" access="public" returntype="numeric" output="false">
	<cfargument name="arrayToSearch" type="array" required="Yes">
	<cfargument name="valueToFind" type="string" required="Yes">
	<cfargument name="dimensionToSearch" type="numeric" required="Yes">
	<cfscript>
		var ii = 1;
		
		//loop through the array, looking for the value
		for(; ii LTE arrayLen(arguments.arrayToSearch); ii = ii + 1){
			//if this is the value, return the index
			if(NOT compareNoCase(arguments.arrayToSearch[ii][arguments.dimensionToSearch], arguments.valueToFind))
				return ii;
		}
		//if we've gotten this far, it means the value was not found, so return 0
		return 0;
	</cfscript>
</cffunction>