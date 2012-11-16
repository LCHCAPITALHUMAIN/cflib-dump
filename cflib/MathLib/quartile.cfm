function quartile(values, q) {
	var valueArray = 0;
	var numValues = 0;
	var leftIndex = 0;
	var rightIndex = 0;
	var middleIndex = 0;
	var median = 0;
	var i = 0;
	var halfValues = ArrayNew(1);
	var val = 0;

	if (IsArray(values)){
		valueArray = Duplicate(values);
	} else {
		valueArray = ListToArray(values);
	}

	ArraySort(valueArray,"numeric");
	numValues = ArrayLen(valueArray);

	// get the median
	if((numValues mod 2) eq 0) {
		leftIndex = Int(numValues/2);
		rightIndex = Int(numValues/2) + 1;
		median = (valueArray[leftIndex] + valueArray[rightIndex]) / 2;
	} else {
		middleIndex = Int(numValues/2) + 1;
		median = valueArray[middleIndex];
	}

	// return the quartile
	if (q eq 1) {
		for (i = 1; i lte numValues; i = i + 1){
			val = valueArray[i];
			if ( val lt median) {
				ArrayAppend(halfValues,val);
			} else {
				break;
			}
		}
		return Quartile(halfValues,2);
	} else if (q eq 2) {
		return median;
	} else if (q eq 3) {
		for (i = numValues; i gt 0; i = i - 1){
			val = valueArray[i];
			if ( val gt median) {
				ArrayAppend(halfValues,val);
			} else {
				break;
			}
		}
		return Quartile(halfValues,2);
	}

	// return a blank string if invalid quartile
	return "";

}