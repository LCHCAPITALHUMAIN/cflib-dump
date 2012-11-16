function getNameInitials(str) {
	var newstr = "";
	var word = "";
	var i = 1;
	var strlen = listlen(str," ");
	for(i=1;i lte strlen;i=i+1) {
		word = ListGetAt(str,i," ");
		newstr = newstr & UCase(Left(word,1));
	}
	return newstr;
}