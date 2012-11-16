function CommaFormat(inNum) {
	var outStr  = "";
	var decStr  = "";

	var default_value = inNum;
	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	if (not IsNumeric(inNum)) {
		return (default_value);
	} else {
		if(ListLen(inNum, ".") GT 1) {
			outStr = ListFirst(inNum, ".");
			decStr = "." & ListLast(inNum, ".");
		} else if (Find(".", Trim(inNum)) EQ 1) {
			decStr = inNum;
		} else {
			outStr = inNum;
		}
		if (Trim(outStr) NEQ "") {
			outStr = Reverse(outStr);
			outStr = REReplace(outStr, "([0-9][0-9][0-9])", "\1,", "ALL");
			outStr = REReplace(outStr, ",$", "");   // delete potential leading comma
			outStr = REReplace(outStr, ",([^0-9]+)", "\1");   // delete leading comma w/ spaces in front of
			outStr = Reverse(outStr);
		}
		return (outStr & decStr);
	}
}