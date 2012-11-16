<cffunction name="arrayTrim" access="public" returntype="array" output="false" hint="This method trims an array to the specified number of elements. Triming is from right to left by default">
	<cfargument name="aArray" type="array" required="true" hint="The array to be trimed">
	<cfargument name="iLength" type="numeric" required="true" hint="The length the array is to be trimmed to">
	<cfargument name="sTrimFrom" type="string" required="false" hint="Direction of the array trim. RIGHT->LEFT|R, LEFT-RIGHT|L" default="L">
	<cfscript>
		var stLocal							= structNew();

		stLocal.aTrimmedArray 				= arguments.aArray;										// set trimmed array
		stLocal.iLoopIteration				= arrayLen(stLocal.aTrimmedArray)-arguments.iLength; 	// get number of delete iterations

		// check if new length is less that the current length
		if(arguments.iLength lt  arrayLen(stLocal.aTrimmedArray)){
			for(stLocal.i = 1; stLocal.i lte stLocal.iLoopIteration;stLocal.i = stLocal.i + 1){
				// get index of array element to delete
				if(compareNoCase(arguments.sTrimFrom,"R") EQ 0){
					stLocal.iDeleteIindex	=  arrayLen(stLocal.aTrimmedArray);
				}
				else{
					stLocal.iDeleteIindex	= 1;
				}

				// delete array element
				arrayDeleteAt(stLocal.aTrimmedArray, stLocal.iDeleteIindex);
			}
		}

		return stLocal.aTrimmedArray;
	</cfscript>
</cffunction>