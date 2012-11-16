function ColumnLoop(query, columnName, theEval) {
	var row = 0;
	var x = "";
	var rec_count = query.recordCount;
	for(row=1; row LTE rec_count; row=row+1) {
		x = query[columnName][row];
		querySetCell(query,columnname,evaluate(theEval),row);
	}
	return query;
}