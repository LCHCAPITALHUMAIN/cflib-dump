function DynamicValueList(query,col) {
	var delim = ",";
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	return arrayToList(query[col],delim);
}