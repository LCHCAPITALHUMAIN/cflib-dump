function queryColumnToArray(qry, column) {
	var arr = arrayNew(1);
	var ii = "";
	var loop_len = arguments.qry.recordcount;
	for (ii=1; ii lte loop_len; ii=ii+1) {
		arrayAppend(arr, arguments.qry[arguments.column][ii]);
	} 
	return arr;
}