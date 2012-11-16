function decBitwiseToQuery(decVal,colName) {
	// create an empty counter
	var i = "";
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	
	// create a query object
	var qry = queryNew(colName);
	
	// loop through the places in the binary number, going from right to left.
	// Note, this is a brute-force method, and I'm sure some smart person out there
	// could figure out how to do this with pure bitwise functions. Me, I'm not that person.
	for(i = len(bVal); ; i = i - 1) {
			// set cur to the decimal value of the current binary place value
			cur = val(b * mid( bVal , i , 1 ));
			
			// If the result is greater than zero, add the result as a row to the query
			if (cur gt 0) {
				queryAddRow(qry);
				querySetCell(qry,colName,cur);
			};
				
			// double the value of our binary seed, for the next place if necessary
			b = 2 * b;
			
			//exit loop when the last place is processed
			if (i eq 1) break;
		}
	
	// return the query object
	return qry;
}