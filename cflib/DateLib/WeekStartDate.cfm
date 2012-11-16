function weekStartDate(weekNum,weekYear) {
	var weekDate = dateAdd("WW",weekNum-1,"1/1/" & weekYear);
	var toDay1 = dayofweek(weekDate)-1;
	var weekStartDate = dateAdd("d",-toDay1,weekDate);
	if(arrayLen(arguments) gte 3 and arguments[3]) weekStartDate = dateAdd("d",1,weekStartDate);
	return weekStartDate;	
 }