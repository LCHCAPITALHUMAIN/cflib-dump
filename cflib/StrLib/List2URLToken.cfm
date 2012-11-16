function List2UrlToken(fields){
	// Set Local Variables
	var token="";
	var excluded="";
	var delim=",";
	var i = 1;
	var tmpObj = "";
	
	if(arrayLen(arguments) gte 2) excluded = arguments[2];
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	// Begin Processing
	for(i=1;i LTE listlen(fields,delim);i=i+1){
		if(not ListFind(excluded,listgetat(fields,i,delim))){
			tmpObj=listgetat(fields,i,delim);
			if(len(token)) token="#token#&#tmpObj#=#urlEncodedFormat(evaluate(tmpObj))#"; 
			else token="#tmpObj#=#URLEncodedFormat(evaluate(tmpObj))#"; 
		}
	}
	return token;
}