function listGetDistinctValues(theList) {
	var distinctValues = "";
	var totalValues = 0;
	var i = 0;
	var currentElement = "";
	var delimiter = ",";
	
	// If the user specifies their own delimiter, use that one instead
	if (arrayLen(arguments) GT 1) delimiter = arguments[2];
	
	totalValues = listLen( theList, delimiter );
	
	// Loops over each element in the original list and appends the current
	// element if it does not already exist in the distinct values list
	for (i=1; i LTE totalValues; i=i+1) {
		currentElement = listGetAt(theList, i, delimiter);
		if (not listFind(distinctValues, currentElement, delimiter) ) {
			distinctValues = listAppend(distinctValues, currentElement, delimiter);
		}
	}
	
	return distinctValues;
}