function LenStruct(structIn) {
	var i = 0;
	var structIn_count = StructCount(structIn);
	var struct0ut = StructNew();
	var ending = "_Len";
	var excludeList = "";
	var key = "";
	
	// Check if excludeList was passed
	if(arrayLen(Arguments) GT 1) {
		excludeList = Arguments[2];
	} 
	
	// Check if different ending was passed
	if(arrayLen(Arguments) GT 2) {
		ending = Arguments[3];
	} 
	for (key IN structIn) {
		if (NOT listFindNoCase(excludeList,key) AND isSimpleValue(structIn[key])) {
			structOut[key&ending] = Len(structIn[key]);
		} 
	} 
	return structOut;
}