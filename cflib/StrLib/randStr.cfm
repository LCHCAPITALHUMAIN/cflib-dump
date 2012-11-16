function randStr(strLen, charSet) {
	var usableChars = "";
	var charSets = arrayNew(1);
	var tmpStr = "";	
	var newStr = "";
	var i = 0;
	var thisCharPos = 0;
	var thisChar = "";
	
	charSets[1] = '48,57';	// 0-9
	charSets[2] = '65,90';	// A-Z
	charSets[3] = '97,122';	// a=z
	
	if (findnocase('alpha', charSet)) { usableChars = listappend(usableChars, 3); }
	
	if (findnocase('numeric', charSet)) { usableChars = listappend(usableChars, 1); }
	
	if (findnocase('upper', charSet)) { usableChars = listappend(usableChars, 2); }
	
	if (len(usableChars) is 0) { usableChars = '1,2,3'; }

	if(listlen(strLen) gt 1 and listfirst(strLen) lt listlast(strLen)) { strLen = randrange(listfirst(strLen), listlast(strLen)); }
	else if (val(strLen) is 0) { strLen = 8; }
	
	
	while (len(tmpStr) LE strLen-1)
	{
		thisSet = listFirst(usableChars);
		usableChars = listdeleteat(usableChars, 1);
		usableChars = listappend(usableChars, thisSet);
	
		tmpStr = tmpStr & chr(randrange(listfirst(charSets[thisSet]), listlast(charSets[thisSet])));
	}
	
	for (i=1; i lte strLen; i=i+1)
	{
		thisCharPos = randrange(1, len(tmpStr));
		thisChar = mid(tmpStr, thisCharPos, 1);
		tmpStr = removeChars(tmPStr, thisCharPos, 1);
		newstr = newstr & thisChar;
	}
	
	return newStr;
}