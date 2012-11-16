function setFileDate(filename){
	var newDate = Now();
	if (ArrayLen(Arguments) GTE 2) { newDate = arguments[2]; }
	if (not isdate(newDate)) { return false; }
	else if (newDate LT '1/1/1970') { return false; }
	if (not fileExists(filename)) { return false; }
	newDate = DateDiff("s", DateConvert("utc2Local", "January 1 1970 00:00"), newDate) * 1000;
	return CreateObject("java","java.io.File").init(JavaCast("string",filename)).setLastModified(newDate);
}