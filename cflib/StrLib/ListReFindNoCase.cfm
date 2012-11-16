function ListReFindNoCase(list, regexp) {
	var i = 1;
	var delimiter = ",";
	
	if(arrayLen(arguments) gte 3) delimiter = arguments[3];

	for (i=1; i le listLen(list, delimiter); i=i+1) {
		if ( ReFindNoCase(regexp, listGetAt(list, i, delimiter)) ) 	return i;
	}
	
	return 0;
}