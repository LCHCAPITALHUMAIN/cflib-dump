function richTextUnicodeFormat(str) {
	var u = "";
	var i = 1;
	var ch = "";
	
	for (;i lte Len(str);i=i+1) {
		ch = Mid(str, i, 1);
		u = u & "\u" & Asc(ch) & " ~";
	}
	return u;
}