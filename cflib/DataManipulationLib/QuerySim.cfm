function querySim(queryData) {
	var fieldsDelimiter="|";
	var colnamesDelimiter=",";
	var listOfColumns="";
	var tmpQuery="";
	var numLines="";
	var cellValue="";
	var cellValues="";
	var colName="";
	var lineDelimiter=chr(10) & chr(13);
	var lineNum=0;
	var colPosition=0;

	// the first line is the column list, eg "column1,column2,column3"
	listOfColumns = Trim(ListGetAt(queryData, 1, lineDelimiter));
	
	// create a temporary Query
	tmpQuery = QueryNew(listOfColumns);

	// the number of lines in the queryData
	numLines = ListLen(queryData, lineDelimiter);
	
	// loop though the queryData starting at the second line
	for(lineNum=2;  lineNum LTE numLines;  lineNum = lineNum + 1) {
	    cellValues = ListGetAt(queryData, lineNum, lineDelimiter);

		if (ListLen(cellValues, fieldsDelimiter) IS ListLen(listOfColumns,",")) {
			QueryAddRow(tmpQuery);
			for (colPosition=1; colPosition LTE ListLen(listOfColumns); colPosition = colPosition + 1){
				cellValue = Trim(ListGetAt(cellValues, colPosition, fieldsDelimiter));
				colName   = Trim(ListGetAt(listOfColumns,colPosition));
				QuerySetCell(tmpQuery, colName, cellValue);
			}
		} 
	}
	
	return( tmpQuery );
	
}