function listCountListInList(lst1, lst2) {
	var delim   = ",";
	var cnt 	= 0;
	var pos 	= 0;
	var item    = "";
	
	if (arrayLen(arguments) gt 2) delim = arguments[3];
		
	for(item=1; item LTE ListLen(lst2); item = item + 1) {
		pos = listFindNoCase(lst1, ListGetAt(lst2, item));
		if(pos) cnt = cnt + 1;
	}
	
	return cnt;
}