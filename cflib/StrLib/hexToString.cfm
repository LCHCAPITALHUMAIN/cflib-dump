function hexToString(hex) {
	
	var str = "";
	var i = 0;
		
	for (i=1; i LTE len(hex); i=i+2) {
		str = str & chr(inputBaseN(mid(hex,i,2),16));
	}
		
	return str;
}