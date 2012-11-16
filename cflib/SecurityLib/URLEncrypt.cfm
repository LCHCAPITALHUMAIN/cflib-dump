function urlEncrypt(queryString, key){
	// encode the string
	var uue = cfusion_encrypt(queryString, key);
        
	// make a checksum of the endoed string
	var checksum = left(hash(uue & key),2);
        
	// assemble the URL
	queryString = "/" & uue & checksum &"/index.htm";
		
	return queryString;
}