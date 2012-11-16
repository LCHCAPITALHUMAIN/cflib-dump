function getWords(str,words) {
	var numWords = 0;
	var oldPos = 1;
	var i = 1;
	var strPos = 0;
	
	str = trim(str);
	str = REReplace(str,"[[:space:]]{2,}"," ","ALL");
	numWords = listLen(str," ");
	if (words gte numWords) return str;
	for (i = 1; i lte words; i=i+1) {
		strPos = find(" ",str,oldPos);
		oldPos = strPos + 1;
	}
	if (len(str) lte strPos) return left(str,strPos-1);
	return left(str,strPos-1) & "...";
}