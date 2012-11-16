function queryRowToArray(query, row){
	var i = 1;
	var queryCols = getMetadata(query);
	var arrayReturn = [];

	for(i = 1; i <= arrayLen(querycols); i++){
		arrayReturn[i] = query[querycols[i].name][arguments.row];
	}
	return arrayReturn;
}