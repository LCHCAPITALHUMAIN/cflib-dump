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