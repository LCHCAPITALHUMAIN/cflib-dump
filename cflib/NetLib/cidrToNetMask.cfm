function cidrToNetMask (cidr) {
	var netMask = "";	

	var post = 0;
	var remainder = cidr MOD 8;
	var divide = cidr \ 8;

	while(divide gt 0) {
		netMask = listAppend(netMask, 255,'.'); 
		divide = divide - 1;
		post = post + 1;		
	}

	if(remainder gt 0) {			
		netMask = listAppend(NetMask,
				  bitSHLN(BitOr(0,2^remainder-1), 8-remainder),
				  '.'); 		
		post = post +1;			
	}

	while(post lt 4) {
		netMask = listAppend(netMask, "0",'.'); 			
		post = post + 1;
	}
	
	if(right(netMask, 1) eq "."){		
		netMask = left(netMask,len(netMask));
	}
	return netMask;
}