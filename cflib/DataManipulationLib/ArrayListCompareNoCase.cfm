function ArrayListCompareNoCase(arrayToSearch,listToFind){
	//a variable for looping
	var ii = 0;		// variable for looping through list
	var jj = 0;		// variable for looping through array
	var delimiter = ',';		// default delimiter
	

	// check to see if delimiters were passed
	if (ArrayLen(arguments) gt 2) delimiter = arguments[3];

	//loop through list
	for(ii = 1; ii LTE ListLen(listToFind, delimiter); ii = ii + 1) {
	//loop through the array, looking for the value
	for(jj = 1; jj LTE arrayLen(arrayToSearch); jj = jj + 1){
		//if this is the value, return the index
		if(NOT compareNoCase(arrayToSearch[jj],ListGetAt(listToFind, ii, delimiter)))
			return jj;
	}
	}
	//if we've gotten this far, it means the value was not found, so return 0
	return 0;
}