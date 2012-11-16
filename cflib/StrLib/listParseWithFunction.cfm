function listParseWithFunction(list,functionName) {
	var delimiters = ",";
	var returnList = "";
	var i = "";
	if(arrayLen(Arguments) gt 2) delimiters = Arguments[2];

	for(i=1;i lte listLen(list, delimiters); i=i+1) returnList = listAppend(returnList, functionName(listGetAt(list, i)), delimiters);
	return returnList;
}