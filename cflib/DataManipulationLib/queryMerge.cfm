function querymerge(querysource,queryoutput,keyColumn){
	var mergeColumn = querysource.columnlist;
	var valueArray = arrayNew(1);
	// define counters
	var i = 1;
	var iRow = 1;
	var jRow = 1;
	//if there is a 4th argument, use that as the mergeColumn
	if(arrayLen(arguments) GT 3) mergeColumn = arguments[4];	
	//loop through the merge column
	for(i=1; i lte listLen(mergeColumn,','); i=i+1) {
		if (listFindNoCase(queryoutput.columnlist,listGetAt(mergeColumn,i,','),',') eq 0) {
		    // loop through each row of queryoutput and add information from querysource
			found = listGetAt(mergeColumn,i,',');
		    for (iRow=1; iRow lte queryoutput.recordcount; iRow=iRow+1) {
			    // find the row in querysource that matches the value in keycolumn from queryoutput  
				jRow = 1;
				while (jRow lt querysource.recordcount and querysource[keyColumn][jRow] neq queryoutput[keycolumn][iRow]) {
				    jRow = jRow + 1;
				}
				if (querysource[keyColumn][jRow] eq queryoutput[keycolumn][iRow]) {
				    valueArray[iRow] = querysource[listGetAt(mergeColumn,i,',')][jRow];
				}
			}
		    // add the columnm
			queryaddcolumn(queryoutput,listGetAt(mergeColumn,i,','),valueArray);
		}
	}
	return queryoutput;
}