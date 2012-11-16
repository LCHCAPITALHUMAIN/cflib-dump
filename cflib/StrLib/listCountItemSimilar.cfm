function listCountItemSimilar(listIn,strToMatch){
	var delim = ",";
	var count = 0;
	var xz = "";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	for(xz=1;xz<=listLen(listIn,delim);xz=xz+1) {
		count = count + findNoCase(strToMatch,left(listGetAt(listIn,xz,delim),len(strToMatch)));									
	}
	return count;
}