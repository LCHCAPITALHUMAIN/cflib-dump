function addPathsToDirectoryQuery(theQuery, basePath) {
	var row = 0;
	var new_col_array = arrayNew(1);

	if (listFindNoCase(theQuery.columnList, "FullPath")) {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			querySetCell(theQuery, "FullPath", basePath & theQuery.name[row], row);
		}
	} else {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			new_col_array[row] = basePath & theQuery.name[row];
		}
		queryAddColumn(theQuery, "FullPath", new_col_array);
	}

	return theQuery;
}