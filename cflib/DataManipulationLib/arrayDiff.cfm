function arrayDiff(smallerArray,biggerArray) {
	var i = "";
	var result = arrayNew(1);
	var s = arrayToList(arguments.smallerArray);
	for (i=1;i lte arrayLen(arguments.biggerArray); i=i+1) if (listFind(s, arguments.biggerArray[i]) is 0) arrayAppend(result, arguments.biggerArray[i]);
	return result;
}