function listFromDateRange (date1,date2) {
	var i 				= 0;
	var numberOfDays	= 0;
	var thisDate	 	= "";
	var theList			= "";
	var temp			= "";
	var thisDelimiter	= ",";

	if(arraylen(arguments) eq 3) thisDelimiter = trim(arguments[3]);
	
	if (date1 GT date2) {
		temp	= date1;
		date1	= date2;
		date2	= temp;
	}

	numberOfDays = dateDiff("d",date1,date2);
	
	for(i = 0; i lte NumberOfDays; i = i + 1){
		thisDate = dateAdd("d",i,date1);
		theList = listAppend(theList,thisDate,thisDelimiter);
	}
	
	return theList;
}