function urlDecrypt(key){
	var queryString = cgi.path_info;
	var scope = "url";
	var stuff = "";
	var oldcheck = "";
	var newcheck = "";
	var i = 0;
	var thisPair = "";
	var thisName = "";
	var thisValue = "";

	// see if a scope is provided if it is set it otherwise set it to url
	if(arrayLen(arguments) gt 1){
		scope = arguments[2];
	}

	if ((right(queryString,3) neq "htm") or (findNoCase("&",queryString) neq 0) or (findNoCase("=",queryString) neq 0)){
		stuff = '<FONT color="red">not encrypted, or corrupted url</FONT>';
	} else {
	
		// remove /index.htm
		querystring = replace(queryString, right(queryString,10),'');
		
		// remove the leading slash
		querystring = replace(queryString, left(queryString,1),'');
		
		// grab the old checksum
           if (len(querystring) GT 2) {
               oldcheck = right(querystring, 2);
               querystring = rereplace(querystring, "(.*)..", "\1");
           } 
           
           // check the checksum
           newcheck = left(hash(querystring & key),2);
           if (newcheck NEQ oldcheck) {
               return querystring;
           }
           
           //decrypt the passed value
		queryString = cfusion_decrypt(queryString, key);
		
			// set the variables
			for(i = 0; i lt listLen(queryString, '&'); i = i + 1){
				
				// Break up the list into seprate name=value pairs
				thisPair = listGetAt(queryString, i + 1, '&');
				
				// Get the name
				thisName = listGetAt(thisPair, 1, '=');
				
				// Get the value
				thisValue = listGetAt(thisPair, 2, '=');
				
				// Set the name with the scope
				thisName = scope & '.' & thisName;
				
				// Set the variable
				setVariable(thisName, thisValue);
			}
		
	}
	
	return stuff;
}