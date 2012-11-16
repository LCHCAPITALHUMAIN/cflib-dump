function businessDaysBetween(date1,date2) {
	var numberOfDays = 0;
	
	while (date1 LT date2) {
		date1 = dateAdd("d",1,date1);
		if(dayOfWeek(date1) GTE 2 AND dayOfWeek(date1) LTE 6) numberOfDays = incrementValue(numberOfDays);
	}

	return numberOfDays;
}