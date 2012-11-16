function isIP(ip){
	var ii = 1;
	//make sure it is a '.' delimited list 4 long
	if(listlen(ip,".") is not 4) return false;

	//make sure each item is a number between 1 and 255
	for(ii = 1;ii lte 4;ii = ii + 1){
		if(not isnumeric(listgetat(ip,ii,".")) OR listgetat(ip,ii,".") GT 255 OR listgetat(ip,ii,".") LT 0)	return false;
	}
	//check for the special cases of 255.255.255.255 or 0.0.0.0, which is not really valid
	if(ip is "255.255.255.255" OR IP is "0.0.0.0") return false;
	return true;
}