function listHasDupes(list) {
	var arr=arraynew(1);
	var caseCheck=false;
	var delim=",";
	var i = 1;
	
	if (arrayLen(arguments) gt 1) delim = arguments[2];	
	if (arrayLen(arguments) gt 2) CaseCheck=Arguments[3];
	
	if(not caseCheck) list = lcase(list);
	
	arr=listToArray(list,delim);
	
	for (;i lte arraylen(arr);i=i+1 ) {
		if (listValueCount(list,arr[i],delim) gt 1) return true;
	}
	return false;
}