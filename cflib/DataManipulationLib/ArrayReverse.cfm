function ArrayReverse(inArray){
	var outArray = ArrayNew(1);
	var i=0;
        var j = 1;
	for (i=ArrayLen(inArray);i GT 0;i=i-1){
		outArray[j] = inArray[i];
		j = j + 1;
	}
	return outArray;
}