function queryColumns(dbquery) {
	var queryFields = "";
	var metadata = dbquery.getMetadata();
	var i = 0;
	var col = "";
	
	for (i = 1; i lte metadata.getColumnCount(); i = i+1) {
		col = metadata.getColumnLabel(javaCast("int", i));
		queryFields = listAppend(queryFields,col);
	}

	return queryFields;
}