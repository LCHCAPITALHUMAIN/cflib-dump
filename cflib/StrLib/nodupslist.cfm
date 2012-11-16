function nodupslist(str){
	var delim = ",";
	if(arrayLen(arguments) is 2) delim = arguments[2];
	return arrayToList(createObject("java","java.util.HashSet").init(ListToArray(str,delim)).ToArray(),delim);
}