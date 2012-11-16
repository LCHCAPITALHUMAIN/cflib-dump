function getRandString(stringLength) {
	var tempAlphaList = "a|b|c|d|e|g|h|i|k|L|m|n|o|p|q|r|s|t|u|v|w|x|y|z";
	var tempNumList = "1|2|3|4|5|6|7|8|9|0";
	var tempCompositeList = tempAlphaList&"|"&tempNumList;
	var tempCharsInList = listLen(tempCompositeList,"|");
	var tempCounter = 1;
	var tempWorkingString = "";
	
	//loop from 1 to stringLength to generate string
	while (tempCounter LTE stringLength) {
		tempWorkingString = tempWorkingString&listGetAt(tempCompositeList,randRange(1,tempCharsInList),"|");
		tempCounter = tempCounter + 1;
	}
	
	return tempWorkingString;
}