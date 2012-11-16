<cffunction name="ArrayOfStructsToStructsOfStructs" access="public" output="false" returntype="struct" hint="Converts an array of structs to an struct of structs">
		<cfargument name="array" type="array" required="true" hint="An array of structures">
		<cfargument name="key" type="string" required="true" hint="Key to use">
		
		<cfscript>
			var stStructOfStructs = structNew();
			var i = 0;
			
			// loop over array
			for(i=1;i lte arrayLen(arguments.array);i=i+1){
				stStructOfStructs[arguments.array[i][arguments.key]] = arguments.array[i];
			}
			
		    return stStructOfStructs;
		    
		</cfscript>		
	</cffunction>