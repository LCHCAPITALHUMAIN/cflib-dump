function listElementPrepend(list,string) {
	var delim = ",";
	var i = "";
	
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	for(i=1; i lte listLen(list); i=i+1) {
		list = listSetAt(list, i, string & listGetAt(list,i));
	}
	
	return list;
}