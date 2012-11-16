function stringToHex(str) {
	var hex = "";
	var i = 0;
	for(i=1;i lte len(str);i=i+1) {
		hex = hex & right("0" & formatBaseN(asc(mid(str,i,1)),16),2);
	}
	return hex;
}