function queryConcat(q1,q2) {
	var row = "";
	var col = "";

	if(q1.columnList NEQ q2.columnList) {
		return q1;
	}

	for(row=1; row LTE q2.recordCount; row=row+1) {
	 queryAddRow(q1);
	 for(col=1; col LTE listLen(q1.columnList); col=col+1)
		querySetCell(q1,ListGetAt(q1.columnList,col), q2[ListGetAt(q1.columnList,col)][row]);
	}
	return q1;
}