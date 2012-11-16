function arraySlice(ary) {
	var start = 1;
	var finish = arrayLen(ary);
	var slice = arrayNew(1);
	var j = 1;

	if (len(arguments[2])) { start = arguments[2]; };
	if (len(arguments[3])) { finish = arguments[3]; };

	for (j=start; j LTE finish; j=j+1) {
		arrayAppend(slice, ary[j]);
	}
	return slice;
}