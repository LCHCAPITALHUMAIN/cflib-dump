function csvToQuery(csvString){
	var rowDelim = chr(10);
	var colDelim = ",";
	var numCols = 1;
	var newQuery = QueryNew("");
	var arrayCol = ArrayNew(1);
	var i = 1;
	var j = 1;
	
	csvString = trim(csvString);
	
	if(arrayLen(arguments) GE 2) rowDelim = arguments[2];
	if(arrayLen(arguments) GE 3) colDelim = arguments[3];

	arrayCol = listToArray(listFirst(csvString,rowDelim),colDelim);
	
	for(i=1; i le arrayLen(arrayCol); i=i+1) queryAddColumn(newQuery, arrayCol[i], ArrayNew(1));
	
	for(i=2; i le listLen(csvString,rowDelim); i=i+1) {
		queryAddRow(newQuery);
		for(j=1; j le arrayLen(arrayCol); j=j+1) {
			if(listLen(listGetAt(csvString,i,rowDelim),colDelim) ge j) {
				querySetCell(newQuery, arrayCol[j],listGetAt(listGetAt(csvString,i,rowDelim),j,colDelim), i-1);
			}
		}
	}
	return newQuery;
}