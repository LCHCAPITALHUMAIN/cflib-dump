function ip2long(ip) {
	var iparr = ListToArray(ip,".");
	if (ArrayLen(iparr) != 4)
		return 0;
	else 
	 	return iparr[1]*256^3 + iparr[2]*256^2 + iparr[3]*256 + iparr[4];
}