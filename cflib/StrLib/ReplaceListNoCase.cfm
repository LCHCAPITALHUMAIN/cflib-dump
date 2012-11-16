function ReplaceListNoCase(str,list1,list2) {
	var i = 1;
	var newval = "";
	for(; i lte listLen(list1); i=i+1) {
		if(i gt listLen(list2)) newval = "";
		else newval = listGetAt(list2,i);
		str = ReplaceNoCase(str,listGetAt(list1,i),newval,"all");		
	}
	return str;
}