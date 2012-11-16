function listFindMaxOccurance(list){
	var i = "";
	var delim = ",";
	var maxitem = "";
	var maxcount = 0;
	var thisItem = "";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
		
	for(i=1;i lte listLen(list,delim );i=i+1) {
		thisItem = listGetAt(list,i,delim);
		if(listValueCount(list,thisItem,delim) gt maxcount) {
			maxcount = listValueCount(list,thisItem,delim);
			maxitem = thisItem;
		}
	}
	return maxitem;
}