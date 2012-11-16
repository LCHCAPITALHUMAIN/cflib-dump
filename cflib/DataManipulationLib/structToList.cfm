function structToList(s) {
	var delim = "&";
	var i = 0;
	var newArray = structKeyArray(arguments.s);

	if (arrayLen(arguments) gt 1) delim = arguments[2];

	for(i=1;i lte structCount(arguments.s);i=i+1) newArray[i] = newArray[i] & "=" & arguments.s[newArray[i]];

	return arraytoList(newArray,delim);
}