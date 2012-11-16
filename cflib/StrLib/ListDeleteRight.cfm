function ListDeleteRight(list, numElements) {
	var i=0;
	var delimiter=",";
	
	if (Arraylen(arguments) gt 2) {
		delimiter=arguments[3];
	}
	
	if (numElements gt ListLen(list, delimiter)) return "";
	
	for (i=1; i lte numElements; i=i+1) {
		list=listDeleteAt(list, listLen(list, delimiter), delimiter);
	}
	return list;
}