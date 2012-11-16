function AsciiToDec(string) {
	var order="i";		//Optional arrtibute: Byte Order
						//"i"= Intel (default)
						//"m"= Motorola
	var signed=false;	//Optional attribute: Signed
						//false= unsigned (default)
						//true= signed
						//"tcn"= 2's Complement Notation
	var result=0;
	var i=0;
	
	if (ArrayLen(arguments) gt 1) {
		order = arguments[2];
	}
	if (ArrayLen(arguments) gt 2) {
		signed = arguments[3];
	}
	for (i=1; i LTE len(string)+1; i=i+1) {
		if (order is "i") {
			result = result + (asc(mid(string, i, 1)) * 256^(i-1));
		}
		if (order is "m") {
			result = result + (asc(mid(string, i, 1)) * 256^(len(string)-i));
		}
	}
	switch (signed) {
		case true:
			if (len(string) is 0) { //If the string is "0" the length is calculated as zero,
									//which throws things off, we set the string to " " so
									//it has a length of one.
				string = " ";
			}
			result = result - 256^len(string)/2;
		case "tcn":
			if (result GTE 256^len(string)/2) {
				result = result - 256^len(string);
			}
		default:
			result = result;
	}
	return result;
}