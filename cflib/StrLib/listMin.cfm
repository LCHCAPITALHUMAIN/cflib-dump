function listMin(list){
	var delim = ",";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
	return arrayMin(listToArray(list,delim));
}