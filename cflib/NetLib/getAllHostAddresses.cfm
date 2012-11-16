function getAllHostAddresses(host) {
	var iaclass=""; //holds the Java object
	var addr="";    //holds the array returned by the java object
	var hostaddr=arrayNew(1);    //holds the returned array of IP addresses.
	var i = "";
	   
	// Init class
	iaclass=CreateObject("java", "java.net.InetAddress");

	// Get address
	addr=iaclass.getAllByName(host);

	// Return the address
	for (i=1; i LTE ArrayLen(addr); i=i+1) {
		iaclass = Addr[i]; //can't access Addr[i].getHostAddress() directly in CF5
		hostaddr[i] = iaclass.getHostAddress();
	}
	return hostaddr;
}