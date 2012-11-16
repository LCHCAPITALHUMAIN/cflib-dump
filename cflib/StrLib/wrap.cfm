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
 * Wraps a chunk of text at a given character count.
 * Note that this function needs to be renamed if you are going to use it on a CF MX 6.1 server since 6.1 now has a native wrap() function (that serves a different purpose).
 * 
 * @param str 	 The string to format. (Required)
 * @param maxline 	 Length of each line, defaults to 40. (Optional)
 * @param br 	 The newline string. Defaults to &lt;br&gt;. (Optional)
 * @param breaklongwords 	 Boolean to break words longer than maxline. Defaults to true. (Optional)
 * @return Returns a string. 
 * @author Dave Pomerance (dpomerance@mos.org) 
 * @version 2, August 19, 2003 
 */
function Wrap(str) {
	var maxline = 40;
	var br = "<br>";
	var breaklongwords = 1;
	var filetype = "pc";
	var eol = chr(13) & chr(10);
	var lineofstr = "";
	var returnstr = "";
	var pos = "";

	//check optional args
	if(ArrayLen(arguments) eq 2) {
		maxline = arguments[2];
	} 
	else if(ArrayLen(arguments) eq 3) {
		maxline = arguments[2];
		br = arguments[3];
	}
	else if(ArrayLen(arguments) eq 4) {
		maxline = arguments[2];
		br = arguments[3];
		breaklongwords = arguments[4];
	}

	// determine file type
	if (find(chr(10), str)) {
		if (find(chr(13), str)) {
			filetype = "pc";
			eol = chr(13) & chr(10);
		} else {
			filetype = "unix";
			eol = chr(10);
		}
	} else if (find(chr(13), str)) {
		filetype = "mac";
		eol = chr(13);
	}

	// add space due to CF "feature" of ignoring list elements of length 0
	str = replace(str, eol, " #chr(13)#", "ALL") & " ";
	
	for (i=1; i lte listlen(str, chr(13)); i=i+1) {
		lineofstr = listgetat(str, i, chr(13));
		if (lineofstr eq " ") {
			returnstr = returnstr & br;
			lineofstr = "";
		} else {
			// remove the space
			lineofstr = left(lineofstr, len(lineofstr)-1);
		}
		while (len(lineofstr) gt 0) {
			// determine wrap point
			if (len(lineofstr) lte maxline) pos = len(lineofstr);
			else {
				pos = maxline - find(" ", reverse(left(lineofstr, maxline))) + 1;
				if (pos gt maxline) {
					if (breaklongwords) pos = maxline;
					else {
						pos = find(" ", lineofstr, 1);
						if (pos eq 0) pos = len(lineofstr);
					}
				}
			}
			// add line to returnstr
			returnstr = returnstr & left(lineofstr, pos) & br;
			// remove line from lineofstr
			lineofstr = removechars(lineofstr, 1, pos);
		}
	}

	return returnstr;
}
</cfscript>