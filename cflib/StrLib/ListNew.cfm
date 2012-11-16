function listNew() {
	var arr = arrayNew(1);
	var i = 1;

	for(;i lte arrayLen(arguments);i=i+1) {
		if(arguments[i] neq "") arr[arrayLen(arr)+1] = arguments[i];
	}
	
	return arrayToList(arr);
}