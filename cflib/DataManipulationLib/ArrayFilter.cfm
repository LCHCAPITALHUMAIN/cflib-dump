function arrayFilter(array,filter) {
	var newA = arrayNew(1);
	var i = 1;
	
	for(;i lte arrayLen(array); i=i+1) {
		if(filter(array[i])) arrayAppend(newA,array[i]);
	}
	
	return newA;
}