function queryGetRow(qry,row){
	var result = queryNew('');
	var cols = listToArray(arguments.qry.columnList);
	var i = '';

	for(i=1; i lte arrayLen(cols); i=i+1){
		queryAddColumn(result, cols[i], listToArray(arguments.qry[cols[i]][arguments.row]));
	}

	return result;
}