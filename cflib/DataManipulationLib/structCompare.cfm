function structCompare(LeftStruct,RightStruct) {
	var result = true;
	var LeftStructKeys = "";
	var RightStructKeys = "";
	var key = "";
	
	//Make sure both params are structures
	if (NOT (isStruct(LeftStruct) AND isStruct(RightStruct))) return false;

	//Make sure both structures have the same keys
	LeftStructKeys = ListSort(StructKeyList(LeftStruct),"TextNoCase","ASC");
	RightStructKeys = ListSort(StructKeyList(RightStruct),"TextNoCase","ASC");
	if(LeftStructKeys neq RightStructKeys) return false;	
	
	// Loop through the keys and compare them one at a time
	for (key in LeftStruct) {
		//Key is a structure, call structCompare()
		if (isStruct(LeftStruct[key])){
			result = structCompare(LeftStruct[key],RightStruct[key]);
			if (NOT result) return false;
		//Key is an array, call arrayCompare()
		} else if (isArray(LeftStruct[key])){
			result = arrayCompare(LeftStruct[key],RightStruct[key]);
			if (NOT result) return false;
		// A simple type comparison here
		} else {
			if(LeftStruct[key] IS NOT RightStruct[key]) return false;
		}
	}
	return true;
}