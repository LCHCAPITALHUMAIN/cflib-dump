function unIndent(str) {
	var lines = str.split("\n");
	var i = 0;
	var minSpaceDist = 9999;
	var newStr = "";

	for(i=1; i lte arrayLen(lines); i=i+1) {
		if (len(trim(lines[i]))) {
			minSpaceDist = max( min(minSpaceDist, reFind("[\S]",lines[i])-1), 0);
		}
	}

	for(i=1; i lte arrayLen(lines); i=i+1) {
		newStr = newStr & removeChars(lines[i], 1, minSpaceDist) & chr(10);
	}
	return newStr;
}