function isNumericList(nList) {
	var intIndex	= 0;
	var aryN		= arrayNew(1);
	var strDelim	= ",";

	/*	default list delimiter to a comma unless otherwise specified			*/
	if (arrayLen(arguments) gte 2){
		strDelim	= arguments[2];
	}
  
	/*	faster to work with arrays vs lists										*/
	aryN		= listToArray(nlist,strDelim);
	
	for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=incrementValue(intIndex)) {
		if (compare(val(aryN[intIndex]),aryN[intIndex])) {
			/*	hit a non-numeric list element, send the no-go back				*/
			return false;
		}
	}
	/*	made it through the list at this point, send the ok back				*/	
	return true;
}