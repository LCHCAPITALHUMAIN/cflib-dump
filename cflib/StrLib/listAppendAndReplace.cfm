function listAppendAndReplace( list1, list2, length) {
	var delimiters = ",";
	var pos = length;
	var returnList = list1;
	if (arguments.length ge 4 and len(trim(arguments[4])) gt 0) delimiters = trim(arguments[4]);
	for ( ; pos ge (length - listLen(list2, delimiters)) ; pos = pos - 1) {
		if (listLen(list1, delimiters) gt pos)	returnList = listDeleteAt(returnList, pos + 1, delimiters);
	}
	if (left(list2, 1) eq delimiters) list2 = right(list2, len(list2) - 1);
	returnList = trim(returnList) & iif(right(returnList, 1) neq delimiters and (len(trim(list2)) gt 0 and len(trim(returnList)) gt 0), de(delimiters), de("")) & trim(list2);
	return returnList;
}