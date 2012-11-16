function arrayAppend2D(aName, value1, value2) {
	var theLen = arrayLen(aName);
		
	aName[theLen+1][1] = value1;
	aName[theLen+1][2] = value2;
		
	return aName;
}