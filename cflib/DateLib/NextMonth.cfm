function NextMonth() {
 	var db = iif(arrayLen(arguments),"arguments[1]","now()");
	return DateAdd("m",1,CreateDate(Year(db), Month(db), 1));
}