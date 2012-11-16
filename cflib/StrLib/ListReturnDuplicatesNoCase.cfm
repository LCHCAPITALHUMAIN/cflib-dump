function ListReturnDuplicatesNoCase(list) {
	var i = 1;
	var delimiter = ',';
	var returnValue1 = '';
	var tmpList = list;

	if(arrayLen(arguments) GTE 2) delimiter = arguments[2];
	list = ListToArray(list, delimiter);
	for(i = 1; i LTE ArrayLen(list); i = i + 1) if(ListValueCountNoCase(tmpList, list[i]) GT 1 and not listFindNoCase(returnValue1,list[i],delimiter)) returnValue1 = ListAppend(returnValue1, list[i], delimiter);

	return returnValue1;
}