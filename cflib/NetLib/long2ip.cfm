function long2ip(longip) {
	var ip = "";
	var i = "";
    if (longip < 0 || longip > 4294967295) 
		return 0;
    for (i=3;i>=0;i--) {
        ip = ip & int(longip / 256^i);
        longip = longip - int(longip / 256^i) * 256^i;
        if (i>0) 
			ip = ip & ".";
    }
    return ip;
}