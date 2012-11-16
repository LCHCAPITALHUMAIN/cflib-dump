function queryColumnToList(qry, column) {
	var theList = "";
	var counter = "";
	var num_rows = arguments.qry.recordcount;
	var delim = ",";
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	for (counter=1; counter lte num_rows; counter=counter+1) theList = listAppend(theList, arguments.qry[arguments.column][counter],delim);
	return theList;
}