function differentChars(string){
	var iCount = 0;
	var i = 0;
	var sChars = "";
	var sChar = "";
	var caseSensitive = false;

	if (arrayLen(arguments) eq 2 and isBoolean(arguments[2]) and arguments[2]) {
		caseSensitive = true;
	}
	
	for(i=1;i lte len(string);i=i+1){
		sChar = mid(string, i, 1);
		if (caseSensitive and not find(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		} else if (not caseSensitive and not findNoCase(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		}
	}

	return iCount;
}