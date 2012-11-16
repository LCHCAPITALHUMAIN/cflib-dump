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
 * Calls both DateFormat and TimeFormat on a data object.
 * 
 * @param time 	 A data object. 
 * @param dateFormat 	 The string to use to format dates. Defaults to  
 * @param timeFormat 	 The string to use to format time. Defaults to  
 * @param joinStr 	 This string is placed between the date and time. Defaults to one space character. 
 * @return This function returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, November 26, 2001 
 */
function DateTimeFormat(time) {
	var str = "";
	var dateFormat = "mmmm d, yyyy";
	var timeFormat = "h:mm tt";
	var joinStr = " ";
	
	if(ArrayLen(Arguments) gte 2) dateFormat = Arguments[2];
	if(ArrayLen(Arguments) gte 3) timeFormat = Arguments[3];
	if(ArrayLen(Arguments) gte 4) joinStr = Arguments[4];

	return DateFormat(time, dateFormat) & joinStr & TimeFormat(time, timeFormat);
}
</cfscript>