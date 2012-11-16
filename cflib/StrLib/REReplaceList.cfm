function REReplaceList(str, oldList, newList) {
	var i = 1;
	for (i=1; i lte listLen(oldlist); i=i+1) {
		str = REReplace(str, listGetAt(oldList, i), listGetAt(newList, i), "all");
	}
	return str;
}