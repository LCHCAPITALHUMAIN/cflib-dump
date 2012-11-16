function createWEPKey() {
	var baseKey = "";
	var key = "";
	var defaultLength = 128;
	var length = defaultLength;
	
	/* If user has passed in a specfic key length, and they want a 40-bit key,
	change the value of length to 40 instead of 128.
	Of course, a 40-bit WEP key is trivial to crack, but that is not my problem. */
	if (arrayLen(arguments) eq 1) {
		if(val(arguments[1]) eq 40)
			length = 40;
	}
	
		
	/* 
		CF generated UUIDs look like this:
		73B96C47-F5F1-0F5C-488C7C5170101FA0
		8 chars - 4 chars - 4 chars - 16 chars
		
		First off, generate a base key
	*/
	baseKey = mid(createUUID(),20,16) & mid(createUUID(),15,4) & mid(createUUID(),10,4) & mid(createUUID(),25,2);
	
	/* Create a 40-bit or 128-bit key, as the user requested */
	switch(length) {
		case "40": {
			key = mid(baseKey,10,10);
			break;
		}
		case "128": {
			key = baseKey;
			break;
		}
	} //end switch
	
	return key;
}