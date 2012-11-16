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
 * Slices an array.
 * 
 * @param ary 	 The array to slice. (Required)
 * @param start 	 The index to start with. Defaults to 1. (Optional)
 * @param finish 	 The index to end with. Defaults to the end of the array. (Optional)
 * @return Returns an array. 
 * @author Darrell Maples (drmaples@gmail.com) 
 * @version 1, July 13, 2005 
 */
function arraySlice(ary) {
	var start = 1;
	var finish = arrayLen(ary);
	var slice = arrayNew(1);
	var j = 1;

	if (len(arguments[2])) { start = arguments[2]; };
	if (len(arguments[3])) { finish = arguments[3]; };

	for (j=start; j LTE finish; j=j+1) {
		arrayAppend(slice, ary[j]);
	}
	return slice;
}
</cfscript>