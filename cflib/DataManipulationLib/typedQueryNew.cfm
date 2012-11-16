function typedQueryNew(columnData) {
	
	var columnname = "";
	var stringofColumns = "";
	var stringofTypes = "";
	var counter = 0;
	
	for (columnName in arguments.columnData) {
		counter++;
			
		stringOfColumns &= columnName;
		stringOfTypes &= arguments.columnData[columnName];
		if (counter NEQ StructCount(arguments.columnData)) {
			stringofColumns &= ", ";
			stringofTypes &= ", ";
			}
		}

	return queryNew(stringofColumns,stringofTypes);

	}