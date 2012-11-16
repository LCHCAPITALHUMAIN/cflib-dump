function checkAsc(str){ 
	var i = 1;
	var nr = "";
	var denylist = "";
		
	if(arrayLen(arguments) gte 2) denylist = arguments[2];
	while (i LTE len(str)) { 
		nr = asc(mid(str,i,1)); 
		if (nr LT 33 OR nr GT 126 OR listFind(denylist,nr)){
			return false;
		} 
		i = i + 1; 
	} 

	return true; 
}