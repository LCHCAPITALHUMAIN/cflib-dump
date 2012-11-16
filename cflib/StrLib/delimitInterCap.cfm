function delimitInterCap(str,delimiter,capFirst) {
	var newStr = '';
	var currentChar = '';
	var replaceStr = '';
	var i = 0;
	//should the first letter be upper case?
	if (isBoolean(capFirst) and capFirst is true) {
		newStr = uCase(left(str,1));
	} else {
		newStr = left(str,1);
	}
	//loop over each character in the string starting with the second
	for (i = 2; i lte len(str); i = i + 1) {
		//get the character at this index
		currentChar = mid(str,i,1);
		//search for capital letters
		if  (reFind('[A-Z]',currentChar)) {
			//if capital, prepend with delimiter
			replaceStr = delimiter & currentChar;
			//append to the new string
			newStr = newStr & replaceStr;
		} else {
			//append original character to the new string
			newStr = newStr & currentChar;
		}
	}
	return newStr;
}