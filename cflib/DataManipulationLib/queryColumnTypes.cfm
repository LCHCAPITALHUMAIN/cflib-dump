function queryColumnTypes(dbquery) {
	var columnTypes="";
	var metadata=dbquery.getMetadata();
	var i=0;
	var column="";

	for (i=1; i lte metadata.getColumnCount(); i=i+1) {
		column = metadata.getColumnLabel(javaCast("int",i));
		columnTypes = listAppend(columnTypes,dbquery.getColumnTypeName(metadata.getColumnType(dbquery.findColumn(column))));
	}

	return columnTypes;
}