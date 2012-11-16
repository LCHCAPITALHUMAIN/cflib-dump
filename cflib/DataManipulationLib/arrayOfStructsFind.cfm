function arrayOfStructsFind(Array, SearchKey, Value){
	var result = 0;
	var i = 1;
	var key = "";
	for (i=1;i lte arrayLen(array);i=i+1){
		for (key in array[i])
		{
			if(array[i][key]==Value and key == SearchKey){
				result = i;
				return result;
			}
		}
	}
    
    return result;
}