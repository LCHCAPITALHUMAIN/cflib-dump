function shiftArray(inArray,ShiftOnVal) {
	var tmpArray = arrayNew(1);
	var x = 0;
        
	for(x=1; x lte arrayLen(inArray); x=x+1) {
		if(inArray[x] EQ ShiftOnVal) { break; }
		else {
			arrayAppend(tmpArray,inArray[x]);
			arrayDeleteAt(inArray,x);
			x=0;
		}
	}

	for(x=1;x lte arrayLen(tmpArray); x=x+1) arrayAppend(inArray,tmpArray[x]);
        
	return inArray;
}