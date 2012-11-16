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
 * Reads a file.
 * 
 * @param file 	 The filename to read. 
 * @param from 	 The line number specifying where to begin reading. 
 * @param to 	 The line number specifying where to stop reading. 
 * @param NL 	 Character to use for newlines. Defaults to Chr(13)Chr(10) 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, December 3, 2001 
 */
function FileRead(filename) {
	var fileStr = "";
	var fileReaderClass = createObject("java", "java.io.FileReader");
	var fileReader = fileReaderClass.init(filename);
	var lineNumberReaderClass = createObject("java","java.io.LineNumberReader");
	var lineReader = lineNumberReaderClass.init(fileReader);
	var notDone = true;
	var lastLine = 0;
	var thisLine = 0;
	var NL = Chr(13) & Chr(10);
	var from = 0;
	var to = 0;
	var line = "";
	
	//optional FROM
	if(arrayLen(arguments) gt 1) from = arguments[2];
	//optional TO
	if(arrayLen(arguments) gt 2) to = arguments[3];
	//optional NL
	if(arrayLen(arguments) gt 3) NL = arguments[4];
	
	if(not fileExists(filename)) return "";
	
	while(notDone) {
		line = lineReader.readLine();
		thisLine = lineReader.getLineNumber();
		if( (from is 0 OR thisLine gte from) AND (to is 0 OR thisLine lte to)) fileStr = fileStr & line & NL;
		if(thisLine is lastLine) notDone = false;
		lastLine = thisLine;
	}
	
	return fileStr;
}
</cfscript>