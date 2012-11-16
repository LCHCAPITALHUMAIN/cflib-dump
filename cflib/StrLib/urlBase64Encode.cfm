function urlBase64Encode(str){
	
	/* encodes a string to base64 format,
	then urlEncodes the result so that it
	works when used as part of a URL string */
	
	var result = "";
	
	/* convert string to base64 format */
	result = toBase64(str);
	
	/* urlEncode to convert base64 chars that do not work when rendered in a URL 
	Note that this uses the single-argument format to work with earlier versions of CF. */
	result = urlEncodedFormat(result);
	
	return result;
};