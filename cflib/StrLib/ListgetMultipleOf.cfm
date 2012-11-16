function ListgetMultipleOf(List,factorOf){
	var delim = ",";
	var result = "";
	var i = 1;
	
	if (factorOf lte 0) return result;
	if (ArrayLen(arguments) gt 2) delim = arguments[3];
			
	for (i=1;i lte ListLen(List,delim); i = i+1) {
		if (i mod factorOf eq 0) result = ListAppend(result,ListGetAt(List,i,delim),delim);
	}
		
	return result;
}