function midLimit(sString,nLimit) {
	var nLength = Len(sString);
	var nPercent = nLimit/nLength;
	var nStart = Round(nLimit * .5);
	var nRemoveCount = (nLength - nLimit);
	var sResult = "";
	
	if(nLength GT nLimit) {
		sResult = RemoveChars(sString,nStart,nRemoveCount+3);
		sResult = Insert("...",sResult,nStart-1);
	} else {
		sResult = sString;
	}
	
	return sResult;
}