function createMod10(number) {
	// this function generates the check digit and appends it to the orignal string
	var nDigits = len(arguments.number);
	var sum = 0;
	var i=0;
	var digit = "";
	var checkdigit = 0;
	for (i=0; i LT nDigits; i=i+1) {
		digit = mid(arguments.number, nDigits-i, 1);
		if(NOT (i MOD 2)) {
			digit = digit+digit;
			// check to see if we should add
			if(len(digit) gt 1) {
				digit = left(digit,1) + right(digit,1);
			}
		}
		checkdigit = checkdigit + digit;
	}
	// divid by 10 and subtract from 10
	checkdigit = 10 - (checkdigit mod 10);
	return arguments.number & right( checkdigit, 1 );
}