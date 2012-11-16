function arrayOfStructsToStructOfArrays(ar) {
	var st = structNew();
	var arKeys = structKeyArray(ar[1]);
	var i=0;
	var j=0;
	var arLen = arrayLen(ar);
	for (i=1;i lte arrayLen(arKeys);i=i+1) {
		st[arKeys[i]] = arrayNew(1);
		for (j=1;j lte arLen;j=j+1) {
			st[arKeys[i]][j] = ar[j][arKeys[i]];
		}
	}
	return st;
}