function ListRemoveByString(list, str) {
	var i = listLen(list);
	var mode = true;
	var delim = ",";
	
	if(arrayLen(arguments) gte 3) mode = arguments[3];
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	for (i=ListLen(list, delim); i gte 1 ; i=i-1) {
		if(  (mode and findNoCase(str,listGetAt(list,i,delim))) or (not mode and not findNoCase(str,listGetAt(list,i,delim)))) list = listDeleteAt(list,i,delim);
	}
	return list;
}