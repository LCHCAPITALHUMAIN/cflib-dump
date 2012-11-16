function percentile(numberToCheck,populationArray){
	// (Thanks to Jim Flannery for pointing me at the formula).
	var ii = 1;
	//set a counter for the number below this value
	var countBelow = 0;
	//set a counter for how many instances of thisNumber there are
	var countWithin = 0;
	// deal with the optional parameter as to whether the number to check is to be added to the population.
	//if there a third argument and it is a boolean and it is true, insert the number to check 
	if(arraylen(arguments) gt 2 AND isBoolean(arguments[3]) and arguments[3])
		arrayAppend(populationArray,numberToCheck);
	//now, let's sort the array to make it easier to find the values
	arraySort(populationArray,"numeric");
	//loop through the array, setting the counters appropriately
	for(ii = 1; ii lte arraylen(populationArray); ii = ii + 1){
		//if this number is below numberToCheck, increment the countBelow
		if(populationArray[ii] lt numberToCheck){
			countBelow = countBelow + 1;
		}
		else{
			//if this number is equal to numberToCheck, increment the counterWithin
			if(populationArray[ii] eq numberToCheck){
				countWithin = countWithin + 1;
			}
			//if this number is above the numberToCheck break
			else{
				break;
			}
		}
	}
	//run the percentile formula and return
	return ((countBelow + 0.5 * countWithin)/arraylen(populationArray))*100;
}