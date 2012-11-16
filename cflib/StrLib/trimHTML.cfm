function trimHTML(str) {
	var htmlList = "<p>,</p>,<br>,<br/>,<br />,&nbsp;";
	var x = 0; var H = ""; var looping = 1;
	while (looping) {
		looping = 0;
		str = Trim(str);
		for (x=1; x lte ListLen(htmlList); x=x+1) {
			H = ListGetAt(htmlList, x);
			if (Left(str, Len(H)) is H) {str = Right(str, Len(str) - Len(H)); looping = 1;}
			if (Right(str, Len(H)) is H) {str = Left(str, Len(str) - Len(H)); looping = 1;}
		}
	}
	return str;
}