function Is7bit(text) {
	if(REFind("[\x80-\xFF]",text)) return false;
	return true;	
}