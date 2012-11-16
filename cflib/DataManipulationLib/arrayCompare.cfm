function arrayCompare(LeftArray,RightArray) {
	var result = true;
	var i = "";
	
	//Make sure both params are arrays
	if (NOT (isArray(LeftArray) AND isArray(RightArray))) return false;
	
	//Make sure both arrays have the same length
	if (NOT arrayLen(LeftArray) EQ arrayLen(RightArray)) return false;
	
	// Loop through the elements and compare them one at a time
	for (i=1;i lte arrayLen(LeftArray); i = i+1) {
		//elements is a structure, call structCompare()
		if (isStruct(LeftArray[i])){
			result = structCompare(LeftArray[i],RightArray[i]);
			if (NOT result) return false;
		//elements is an array, call arrayCompare()
		} else if (isArray(LeftArray[i])){
			result = arrayCompare(LeftArray[i],RightArray[i]);
			if (NOT result) return false;
		//A simple type comparison here
		} else {
			if(LeftArray[i] IS NOT RightArray[i]) return false;
		}
	}
	
	return true;
}