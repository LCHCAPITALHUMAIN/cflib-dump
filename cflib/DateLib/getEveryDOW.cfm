function getEveryDOW(dowlist) {
	var day1 = "";
	var x = "";
	var thisDOW = "";
	var result = arrayNew(1);
	var initialDOW = "";
	var offset = "";
	var dateToAdd = "";
	var startdate = createDate(year(now()), 1, 1);
	var enddate = createDate(year(now()), 12, 31);
	
	day1 = startdate;
	initialDOW = dayOfWeek(day1);

	if(arrayLen(arguments) gte 2) {
		startdate = arguments[2];
	}
	if(arrayLen(arguments) gte 3) {
		enddate = arguments[3];
	}

	while( day1 LT enddate ) {
		for(x=1; x lte listlen(dowlist); x=x+1) {
			thisDOW = listGetAt(dowlist, x);
			offset = thisDOW - initialDOW;
			dayToAdd = dateAdd("d", offset, day1 );
			if (dayToAdd gte startDate and dayToAdd lte endDate) {arrayAppend(result, dayToAdd);}
		}
		day1 = dateAdd("ww", 1, day1);
	}
	return result;
}