function trimZeros(num){	
	if(val(num) == 0){
		return "0";
	} else if (num < 1) {
		return "." & listLast(num + 0,".");	
	} else {
		return num + 0;		
	} 	
}