function decToBinValList(decVal) {
	// create an empty counter
	var i = "";		
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	// create an empty list to hold the results
	var resultList = "";
	
	// loop through the places in the binary number, going from right to left.
	for(i = len(bVal); ; i = i - 1) {			
			cur = val(b * mid( bVal , i , 1 ));
			if (cur gt 0) resultList = listAppend(resultList,cur);

			// double the value of our binary seed
			b = 2 * b;
			//exit loop when the last bit is processed	
			if (i eq 1) break;
		}
	
	// return the list	
	return resultList;
}