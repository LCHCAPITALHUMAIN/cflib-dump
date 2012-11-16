function queryStringToStruct() {
	//var to hold the final structure
	var struct = StructNew();
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var i = 1;
	var pairi = "";
	var keyi = "";
	var valuei = "";
	var qsarray = "";
	var qs = CGI.QUERY_STRING; // default querystring value
	
	//if there is a second argument, use that as the query string
	if (arrayLen(arguments) GT 0) qs = arguments[1];

	//put the query string into an array for easier looping
	qsarray = listToArray(qs, "&");
	//now, loop over the array and build the struct
	for (i = 1; i lte arrayLen(qsarray); i = i + 1){
		pairi = qsarray[i]; // current pair
		keyi = listFirst(pairi,"="); // current key
		valuei = urlDecode(listLast(pairi,"="));// current value
		// check if key already added to struct
		if (structKeyExists(struct,keyi)) struct[keyi] = listAppend(struct[keyi],valuei); // add value to list
		else structInsert(struct,keyi,valuei); // add new key/value pair
	}
	// return the struct
	return struct;
}