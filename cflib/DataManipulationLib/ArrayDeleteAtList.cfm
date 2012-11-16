function ArrayDeleteAtList(a,l) {
	var i=1;
	l = listSort(l, "numeric", "desc");
	for(i=1; i lte listLen(l); i=i+1) arrayDeleteAt(a, listGetAt(l,i));
	return a;
}