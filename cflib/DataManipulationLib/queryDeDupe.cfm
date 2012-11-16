function QueryDeDupe(theQuery,keyColumn) {
	var checkList='';
	var newResult=QueryNew(theQuery.ColumnList);
	var keyvalue='';
	var q = 1;
	var x = "";
	
	// loop through each row of the source query
	for (;q LTE theQuery.RecordCount;q=q+1) {

		keyvalue = theQuery[keycolumn][q];
		// see if the primary key value has already been used
		if (NOT ListFind(checkList,keyvalue)) {
			
			/* this is not a duplicate, so add it to the list and copy
			   the row to the destination query */
			checkList=ListAppend(checklist,keyvalue);
			QueryAddRow(NewResult);
			
			// copy all columns from source to destination for this row
			for (x=1;x LTE ListLen(theQuery.ColumnList);x=x+1) {
				QuerySetCell(NewResult,ListGetAt(theQuery.ColumnList,x),theQuery[ListGetAt(theQuery.ColumnList,x)][q]);
			}
		}
	}
	return NewResult;
}