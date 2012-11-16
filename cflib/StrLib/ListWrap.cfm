function ListWrap(lst, lngth) {
	var newList=lst;
	var br="<br>";
	var delimiter=",";
        var i = lngth;
	// check for optional arguments
	if(ArrayLen(arguments) eq 3) {
		br = arguments[3];
	} else if (ArrayLen(arguments) EQ 4) {
		br = arguments[3];
		delimiter = arguments[4];
	}
	// loop through list
	for (i=lngth; i LE ListLen(lst,delimiter); i=i+lngth) {
		if (ListLen(lst, delimiter) GT i) {
			// append the break string to the next element
			newList = ListSetAt(newList, i+1, br & ListGetAt(lst, i+1, delimiter), delimiter);
		}
	}
	return newList;
}