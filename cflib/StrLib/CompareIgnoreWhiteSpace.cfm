function CompareIgnoreWhiteSpace(string1,string2) {
	var string1NoWhiteSpace = REReplace(string1,"[\s]","","ALL");
	var string2NoWhiteSpace = REReplace(string2,"[\s]","","ALL");
	var isCompareCaseSensitive = true;
	
	if(arrayLen(arguments) gte 3) isCompareCaseSensitive = arguments[3];
	
	if (isCompareCaseSensitive)
		return Compare(string1NoWhiteSpace, string2NoWhiteSpace);
	else
		return CompareNoCase(string1NoWhiteSpace, string2NoWhiteSpace);
}