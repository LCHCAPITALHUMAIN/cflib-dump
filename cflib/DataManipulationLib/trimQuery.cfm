function trimQuery(qry) {
	var col="";
	var i=1;
	var j=1;
	for(;i lte qry.recordCount;i=i+1) {
		for(j=1;j lte listLen(qry.columnList);j=j+1) {
			col=listGetAt(qry.columnList,j);
			querySetCell(qry,col,trim(qry[col][i]),i);
		}
	}
	return qry;
}