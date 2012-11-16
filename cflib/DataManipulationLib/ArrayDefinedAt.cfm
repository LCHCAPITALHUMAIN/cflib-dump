function arrayDefinedAt(arr,pos) {
	var temp = "";
	try {
		temp = arr[pos];
		return true;
	} 
	catch(coldfusion.runtime.UndefinedElementException ex) {
		return false;
	}
	catch(coldfusion.runtime.CfJspPage$ArrayBoundException ex) {
		return false;
	}
}