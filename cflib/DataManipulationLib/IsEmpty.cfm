function isEmpty(varName) {
	var ptr = "";
	
	if(not isDefined(varName)) return true;
	ptr = evaluate(varName);
	
	if(isSimpleValue(ptr)) {
		if(not len(ptr)) return true;
	} else if(isArray(ptr)) {
		if(arrayIsEmpty(ptr)) return true;
	} else if(isStruct(ptr)) {
		if(structIsEmpty(ptr)) return true;
	} else if(isQuery(ptr)) {
		if(not ptr.recordCount) return true;
	}
		
	return false;
}