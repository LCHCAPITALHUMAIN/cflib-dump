function ljustify2(string,length) {
	var padChar = " ";
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	return arguments.string & repeatString(padChar,max(0,arguments.length - len(arguments.string)));
}