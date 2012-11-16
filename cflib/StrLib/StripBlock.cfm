function StripBlock(strString,strFirstChar,strLastChar) 
{
	// Special Chars - Don't include ] (end-bracket) since it must be the
	// first character within brackets [ ] in the regular expression
	var strSpecialChars = "+*?.[^$(){}|\&##-";
	
	// Default to replace all blocks in string unless they passed a scope
	var strScope = "ALL";  
	if (ArrayLen(Arguments) gt 3)
	  	strScope = Arguments[4];
		
	// Escape the start and end chars if they're special
	if (FindNoCase(strFirstChar,strSpecialChars)) 
		strFirstChar = "\" & strFirstChar;
	if (FindNoCase(strLastChar,strSpecialChars)) 
		strLastChar = "\" & strLastChar;

	return REReplaceNoCase(strString,strFirstChar & "[^" & strLastChar & "]*" & strLastChar,"","#strScope#");
}