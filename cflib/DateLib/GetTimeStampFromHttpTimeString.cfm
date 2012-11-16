function GetTimeStampFromHttpTimeString(httpTime) {
	var dateParts = ListToArray(httpTime, " ");
	var timeStamp = "{ts '" & dateParts[4] & "-" & DateFormat("#DateParts[3]#/1/2000", "mm") & "-" & dateParts[2] & " " & dateParts[5] & "'}";
	return timeStamp;
}