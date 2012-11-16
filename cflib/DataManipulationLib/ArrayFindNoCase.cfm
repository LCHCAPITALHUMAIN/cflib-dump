function ArrayFindNoCase(arrayToSearch,valueToFind){
	//a variable for looping
	var ii = 0;
	//loop through the array, looking for the value
	for(ii = 1; ii LTE arrayLen(arrayToSearch); ii = ii + 1){
		//if this is the value, return the index
		if(NOT compareNoCase(arrayToSearch[ii],valueToFind))
			return ii;
	}
	//if we've gotten this far, it means the value was not found, so return 0
	return 0;
}