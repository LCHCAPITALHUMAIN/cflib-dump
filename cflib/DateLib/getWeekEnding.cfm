function getWeekEnding(theMonth,theYear) {
	/**
	 * week ending day is a friday for our purposes as the end of the business week
	 * this can be modified to return a week ending on whatever day you want
	*/
	var endOfWeek = 6;
	var theDay = 0;
	var i = 1;
	var arrDate = arrayNew(1);
	
	var theDate = "";
	
	// loop to find the first friday of the month
	do {
		theDay = theDay + 1;
	} while (dayOfWeek(createDate(theYear,theMonth,theDay)) NEQ endOfWeek);
	// establish the first friday of the month
	theDate = createDate(theYear,theMonth,theDay);
	// set the first week end date in the array
	arrDate[i] = theDate;
	/**
	 * loop through the rest of the month adding seven to the date until the date
	 * exceeds the end of the month
	*/
	i=i+1;
	while (month(dateAdd('d',7,theDate)) EQ theMonth) {
		theDate = dateAdd('d',7,theDate);
		arrDate[i] = theDate;
		i = i + 1;
	}
	return arrDate;
}