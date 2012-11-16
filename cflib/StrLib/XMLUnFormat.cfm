function XMLUnFormat(string) {
	var resultString=string;
	resultString=ReplaceNoCase(resultString,"&apos;","'","ALL");
	resultString=ReplaceNoCase(resultString,"&quot;","""","ALL");
	resultString=ReplaceNoCase(resultString,"&lt;","<","ALL");
	resultString=ReplaceNoCase(resultString,"&gt;",">","ALL");
	resultString=ReplaceNoCase(resultString,"&amp;","&","ALL");
	return resultString;
}