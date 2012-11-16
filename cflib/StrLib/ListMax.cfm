function ListMax(list){
	var delim = ",";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
	return arrayMax(listToArray(list,delim));
}