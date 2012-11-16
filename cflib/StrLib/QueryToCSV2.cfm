function QueryToCSV2(query){
	var csv = createobject( 'java', 'java.lang.StringBuffer');
	var i = 1;
	var j = 1;
	var cols = "";
	var headers = "";
	var endOfLine = chr(13) & chr(10);
	if (arraylen(arguments) gte 2) headers = arguments[2];
	if (arraylen(arguments) gte 3) cols = arguments[3];
	if (not len( trim( cols ) ) ) cols = query.columnlist;
	if (not len( trim( headers ) ) ) headers = cols;
	headers = listtoarray( headers );
	cols = listtoarray( cols );
	
	for (i = 1; i lte arraylen( headers ); i = i + 1)
		csv.append( '"' & headers[i] & '",' );
	csv.append( endOfLine );
	
	for (i = 1; i lte query.recordcount; i= i + 1){
		for (j = 1; j lte arraylen( cols ); j=j + 1){
			if (isNumeric( query[cols[j]][i] ) )
				csv.append( query[cols[j]][i] & ',' );
			else
				csv.append( '"' & query[cols[j]][i] & '",' );
			
		}
		csv.append( endOfLine );
	}
	return csv.toString();
}