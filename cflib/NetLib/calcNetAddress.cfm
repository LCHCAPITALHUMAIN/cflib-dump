function calcNetAddress (myIP, myNetMask) {
	var NetAddress = "";
	var i = 1;
	
	for (i = 1; i lte 4; i = i + 1) {
		NetAddress = ListAppend(NetAddress, BitAnd(ListGetAt(myIP,i,'.'),ListGetAt(myNetMask,i,'.')) ,'.'); 
	}
	return NetAddress;
}