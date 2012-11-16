function numTextListSort(list) {
	var numArray=arrayNew(1);
	var textArray=arrayNew(1);
	var mg = 1;
	var data = "";
	
	//convert to array for speed
	data = listToArray(list);
	
	//loop through the list passed to the function
	for(;mg lte arrayLen(data);mg=mg+1){
		//if the value at this position of the list is numeric put it in the numList List
		if(isNumeric(data[mg])) numArray[arrayLen(numArray)+1] = data[mg];
		//else put it in the textList List
		else textArray[arrayLen(textArray)+1] = data[mg];
	}
	
	//sort the numList
	arraySort(numArray,"numeric");
	//sort the textList
	arraySort(textArray,"text");
	//put together
	for(mg=1;mg lte arrayLen(textArray);mg=mg+1) {
		numArray[arrayLen(numArray)+1] = textArray[mg];
	}
	
	//return the mainList
	return arrayToList(numArray);
	
}