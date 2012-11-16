function countArbitraryDays(startdate,enddate) { 
	var exclude = "1,7"; var IncludeStartDate = true; 
	var daysperweek = 0; var days = 0; 
	var weekday = ArrayNew(1); var x = 0; 
	var maxdays = DateDiff("d",dateadd("d",-1,startdate),enddate); 
	
	switch (arrayLen(arguments)) { 
		case 4: { IncludeStartDate = arguments[4]; } 
		case 3: { exclude = arguments[3]; } 
	} 
	
	// create an array to hold days of the week with 1 or 0 indicating if the day is counted 
	arraySet(weekday,1,7,1); exclude = listToArray(exclude); 
	for (x = 1; x lte arrayLen(exclude); x = x + 1) { weekday[exclude[x]] = 0; } // set the value of any excluded day to 0 
	daysperweek = arraySum(weekday); // count the number of included days in a full week 
	days = daysperweek * int(maxdays/7); // get the number of included days in all full weeks 
	for (x = 1; x lte maxdays mod 7; x = x + 1) { // add any remaining days in the last partial week 
		days = days + weekday[dayofweek(enddate)]; 
		enddate = dateadd("d",-1,enddate); 
	} 
	
	// if excluding the start date, remove the value that might have been added for the starting day 
	if (not includeStartDate) { days = days - weekday[dayofweek(startdate)]; } 
	
	return days; 
}