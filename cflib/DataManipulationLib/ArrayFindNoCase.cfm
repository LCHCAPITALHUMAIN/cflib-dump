<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Like listFindNoCase(), but for arrays.
 * 
 * @param arrayToSearch 	 The array to search. (Required)
 * @param valueToFind 	 The value to look for. (Required)
 * @return Returns a number. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, September 6, 2002 
 */
function ArrayFindNoCase(arrayToSearch,valueToFind){
	//a variable for looping
	var ii = 0;
	//loop through the array, looking for the value
	for(ii = 1; ii LTE arrayLen(arrayToSearch); ii = ii + 1){
		//if this is the value, return the index
		if(NOT compareNoCase(arrayToSearch[ii],valueToFind))
			return ii;
	}
	//if we've gotten this far, it means the value was not found, so return 0
	return 0;
}
</cfscript>