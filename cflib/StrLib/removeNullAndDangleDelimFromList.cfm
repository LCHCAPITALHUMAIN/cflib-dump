function removeNullAndDangleDelimFromList(lst){
	var listDelim=",";
	if (arraylen(arguments) gt 1)
		listDelim=arguments[2];
	return ArrayToList(ListToArray(arguments.lst,listDelim));
}