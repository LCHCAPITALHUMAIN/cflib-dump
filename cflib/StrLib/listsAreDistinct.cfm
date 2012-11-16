function listsAreDistinct(list1,list2){
	var delim1 = ",";
	var delim2 = ",";
	var ii = 0;
	var array = "";
	//deal with the optional delimiter arguments
	switch(arrayLen(arguments)) {
		case 3:
		{
			delim1 = arguments[3];
			break;
		}
		case 4:
		{
			delim1 = arguments[3];
			delim2 = arguments[4];
			break;
		}
	}
	//make list1 into an array for easy looping
	array = listToArray(list1,delim1);
	//loop through list1 checking for any matches in list2
	for(ii = 1; ii LTE arrayLen(array); ii = ii + 1){
		//if this element exists in list 2, return false
		if(listFindNoCase(list2,array[ii],delim2))
			return false;
	}
	//if we've gotten this far, the lists are distinct
	return true;
}