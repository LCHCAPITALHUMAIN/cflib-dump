function listFindReplace(string, listToMatch, listToReplace) {
	var index = "";
	var delim = ",";
	
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	index = listFind(listToMatch, string, delim);
	
	if(index neq 0) return listGetAt(listToReplace, index, delim);
	else return string;
}