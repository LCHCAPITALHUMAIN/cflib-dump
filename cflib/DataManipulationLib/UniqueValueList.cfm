function uniqueValueList(queryName, columnName) {
	var cs = 0; 
	var curRow = 1;
	var uniqueList = "";  
	
	if(arrayLen(arguments) GTE 3 AND isBoolean(arguments[3])) cs = arguments[3]; 
	
	for(; curRow LTE queryName.recordCount; curRow = curRow +1){
		if((not cs AND not listFindNoCase(uniqueList, trim(queryName[columnName][curRow]))) OR (cs AND not listFind(uniqueList, trim(queryName[columnName][curRow])))){
			uniqueList = ListAppend(uniqueList, trim(queryName[columnName][curRow]));
		}
	}
	return uniqueList; 
}