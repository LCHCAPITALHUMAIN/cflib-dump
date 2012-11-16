function dice(str,size) {

	var r = "";
	var i = 0;
	var sep = "<wbr/>";	

	if (arrayLen(arguments) GT 2 ) sep = arguments[3];
	
	for ( i=0; i LT len(str); i=i+1 ) {
		if ( (i-size+1) mod size eq 1) r&=sep; 
		r &= str.charAt(i);
	}	
	
	return trim(r);
}