function hrefsToList(inputString) {
	var pos=1;
	var tmp=0;
	var linklist = "";
	var delimiter = ",";
	var endpos = "";
	
	if(arrayLen(arguments) gte 2) delimiter = arguments[2];
		
	while(1) {
		tmp = reFindNoCase("<a[^>]*>[^>]*</a>", inputString, pos);
		if(tmp) {
			pos = tmp;
			endpos = findNoCase("</a>", inputString, pos)+4;
			linkList = listAppend(linkList, mid(inputString, pos, endpos-pos), delimiter);
			pos = endpos;
		}
		else break;
	}

	return linkList;
}