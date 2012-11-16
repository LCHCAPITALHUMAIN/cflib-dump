public array function deDupeArray(required array inputArray) {
	local.arrList = arrayToList(inputArray);
	local.retArr = inputArray;
	for (local.i = arrayLen(inputArray);i gte 1;i=i-1) {
		if (listValueCountNoCase(arrList,inputArray[i]) gt 1) {
			arrayDeleteAt(retArr,i);
			arrList = arrayToList(retArr);
		}
	}
	return retArr;
}