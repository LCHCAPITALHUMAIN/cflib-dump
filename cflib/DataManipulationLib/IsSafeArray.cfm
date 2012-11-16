function IsSafeArray(arr) {
	var i=1;
	var temp = "";
	
	for(i=1; i lte arrayLen(arr); i=i+1) {
		try {
			temp = arr[i];
		} catch(coldfusion.runtime.UndefinedElementException ex) {
			return false;
		}		
	}
	
	return true;
}