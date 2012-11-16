function listLongestItem(list){
	var delim = ","; 
	var item = "";
	var i = 0;
	
	if(arrayLen(arguments) EQ 2) delim = arguments[2];
	for(i = 1 ; i lte listLen(list,delim); i = i + 1 )  {
		if (len(listGetAt(list,i,delim)) gt len(item)) item = listGetAt(list,i,delim); 
	}
	return item; 
}