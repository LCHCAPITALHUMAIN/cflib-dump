function isListInList(l1,l2) {
	var delim1 = ",";
	var delim2 = ",";
	var i = 1;
	var matchany = false;
	
	if(arrayLen(arguments) gte 3) delim1 = arguments[3];
	if(arrayLen(arguments) gte 4) delim2 = arguments[4];
	if(arrayLen(arguments) gte 5) matchany = arguments[5];
	
	for(i=1; i lte listLen(l1,delim1); i=i+1) {
		if(matchany and listFind(l2,listGetAt(l1,i,delim1),delim2)) return true;
		if(not matchany and not listFind(l2,listGetAt(l1,i,delim1),delim2)) return false;
	}
	return not matchany;
}