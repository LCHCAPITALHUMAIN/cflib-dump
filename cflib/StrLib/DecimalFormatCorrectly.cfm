function DecimalFormatCorrectly(number) {
	var lhs=0;
	var rhs=0;
	var decLen = 0;
	var i = 0;
	
	if(ListLen(number, ".") EQ 2) {	//xxx.xxx
		lhs = ListFirst(number, ".");
		rhs = ListLast(number, ".");
	} else if (Find(".", Trim(number)) EQ 1) { // .xx
		rhs = number;
	} else if (Find(".", Trim(number)) EQ 0) {	// xx
		lhs = number;
	} else {
		return number;
	}
	
	if (NOT IsNumeric(lhs) OR NOT IsNumeric(rhs)) return number;
	
	for (i = 0; i LT 2; i=i+1) {
		if (Len(rhs) LT 2) rhs = rhs & "0";
	}
	
	// count how many digits > 2dp there are
	decLen = Len(rhs) - 2; 

	// divide by this number of zeroes
	for (i = 0; i LT decLen; i=i+1) {
		rhs = rhs / 10;
	} 

	// round it
	rhs = Round(rhs);

	if (rhs GTE 100) { 
		rhs = 0;
		lhs = lhs + 1;
	}

	// pad with zeros if necessary
	if (rhs LT 10) {
		rhs = "0" & rhs;
	}	
	
	lhs = NumberFormat(lhs);
	
	return (lhs & "." & rhs);
}