function queryRowToList(query){
	var queryrow = 1;
	var j = 1;
	var querycols = listToArray(query.columnList);
	var delim = ",";
	var listReturn = "";
	if(arrayLen(arguments) GT 1) queryrow = arguments[2];
	if(arrayLen(arguments) GT 2) delim = arguments[3];
	for(j = 1; j lte arraylen(querycols); j = j + 1){
		listReturn = ListAppend(listReturn, query[querycols[j]][queryrow], delim);
	}		
	return listReturn;
}