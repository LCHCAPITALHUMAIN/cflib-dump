function queryToStructOfStructsAutoRow(theQuery){
	var theStructure = StructNew();
	var cols = ListToArray(theQuery.columnlist);
	var row = 1;
	var thisRow = "";
	var col = 1;
	
	for(row = 1; row LTE theQuery.recordcount; row = row + 1){
		thisRow = StructNew();
		for(col = 1; col LTE arraylen(cols); col = col + 1){
			thisRow[cols[col]] = theQuery[cols[col]][row];
		} 
		theStructure[row] = Duplicate(thisRow);
	} 
	return theStructure;
}