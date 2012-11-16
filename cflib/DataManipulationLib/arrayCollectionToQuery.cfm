function arrayCollectionToQuery(arrayColl){
	var qResult = 0;
	var columnList = structKeyList(arguments.arrayColl[1]);
	var typeList = '';
	var numericType = '';
	var k = 0;
	var i = 0;
	for ( k in arguments.arrayColl[1] ){
		if (isNumeric(arguments.arrayColl[1][k])){
			//decimal or integer?
			numericType = 'integer';
			for ( i = 1 ; i lte arrayLen(arguments.arrayColl) ; i = i + 1 ){
				if (arguments.arrayColl[i][k] - fix(arguments.arrayColl[i][k]) eq 0){
					numericType = 'decimal';
					break;
				}
		}
			typelist = listAppend(typeList, numericType);
		} else if (isSimpleValue(arguments.arrayColl[1][k])){
			typeList = listAppend(typeList, 'varchar');
		} else if (isBoolean(arguments.arrayColl[1][k])){
			typeList = listAppend(typeList, 'bit');
		} else if (isDate(arguments.arrayColl[1][k])){
			typeList = listAppend(typeList, 'date');
		} else {
			//we can't throw() in cf8, so uh...
			return "All keys in your array collection must be of one of the following types: Numeric (Int or Float), String, Boolean, Date. The following key contains data that is not one of these types: `#k#`";
		}
	}
	qResult = queryNew(columnList, typeList);
	for ( i = 1 ; i lte arrayLen(arguments.arrayColl) ; i = i + 1 ){
		queryAddRow(qResult);
		for (k in arguments.arrayColl[i]){
			if (not isNumeric(arguments.arrayColl[i][k]) and not isSimpleValue(arguments.arrayColl[i][k]) and not isBoolean(arguments.arrayColl[i][k]) and not isDate(arguments.arrayColl[i][k])){
				return "All keys in your array collection must be of one of the following types: Numeric (Int or Float), String, Boolean, Date. The following key contains data that is not one of these types: `#k#`";
			}
			querySetCell(qResult,k,arguments.arrayColl[i][k]);
		}
	}
	return qResult;
}