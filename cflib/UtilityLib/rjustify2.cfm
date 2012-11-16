function rjustify2(string,length) {
	var padChar = " ";
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	return repeatString(padChar,max(0,arguments.length - len(arguments.string))) & arguments.string;
}