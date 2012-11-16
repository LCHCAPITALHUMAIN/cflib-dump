function findALL(substring,string) {
	var findArray = arrayNew(1);	
	var start = 1;	
	var posStart = "";
	var i = 1;
	var newPos = "";
	
	if(arrayLen(arguments) gte 3) start = arguments[3];

	posStart = find(substring,string,start);
	
	if(posStart GT 0){
		findArray[i] = posStart;
		while(posStart gt 0 ){
			posStart = posStart + 1;
			newPos = find(substring,string,posStart);
			if(newPos gt 0){
				i = i + 1;
				findArray[i] = newPos;
				posStart = newPos;
			}else{
				posStart = 0;
			}
		}
	}else{
		return 0;
	}
	return findArray;
}