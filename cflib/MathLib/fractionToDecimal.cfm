function fractionToDecimal(fraction) {
	var thisNumber		= 0;
	var thisFraction	= 0;
	var thisOut 		= "0.0";

	if (ListLen(arguments.fraction, " ") EQ 1) {
		if (Trim(arguments.fraction) contains  "/") {
			thisOut = Val(ListFirst(arguments.fraction, "/")) / Val(ListLast(arguments.fraction, "/"));
		} else {
			thisOut = Val(Trim(arguments.fraction));
		}
	} else {
		if (Trim(ListLast(arguments.fraction, " ")) contains  "/") {
			thisOut = Val(ListFirst(arguments.fraction, " "));
			thisOut = thisOut + Val(ListFirst(ListLast(arguments.fraction, " "), "/")) / Val(ListLast(ListLast(arguments.fraction, " "), "/"));
		} else {
			thisOut = Val(Trim(arguments.fraction));
		}
	}

	return thisOut;
}