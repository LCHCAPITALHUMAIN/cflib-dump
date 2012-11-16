function ListDeleteRange(list, from, to) {
	var delimiter = ",";
	var i = from;
		
	if(arrayLen(arguments) gt 3) {
		delimiter = arguments[4];
	}
	
	if(to gt listLen(list,delimiter)) to = listLen(delimiter);
	
	for(; i lte to; i=i+1) {	
		list=listDeleteAt(list, from, delimiter);
	}

	return list;
}