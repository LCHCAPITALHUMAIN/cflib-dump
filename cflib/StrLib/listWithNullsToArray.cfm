function listWithNullsToArray(parsedList) {
	var delim = ",";
	if((left(trim(parsedList),1)) EQ delim) parsedList = "null" & parsedList;
	if(arrayLen(arguments) gt 1) delim = arguments[2];
	while(find(delim&delim,parsedList)) parsedList = replace(parsedList,delim&delim,delim & "NULL" & delim,"ALL");
	if(right(parsedList,1) eq delim){
		parsedList = listAppend(parsedList,"NULL",delim);
	}
	return listToArray(parsedList,delim);
}