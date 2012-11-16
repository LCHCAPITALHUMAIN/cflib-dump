function customWeekNumber(date) {
	var firstDayOfWeek = 1;
	var theDate = createdate(year(arguments.date), month(arguments.date), day(arguments.date));
	var firstDayOfYear = createdate(year(theDate), 1, 1);
	var firstCustWeekdayOfYear = "";
	var custWeekNum = 0;
	if (arraylen(arguments) gte 2) firstDayOfWeek = arguments[2];
	if (val(firstDayOfWeek) lt 1 OR val(firstDayOfWeek) gt 7) firstDayOfWeek = 1;
	firstCustWeekdayOfYear = dateadd('d', firstDayOfWeek-dayofweek(firstDayOfYear), firstDayOfYear);
	if (datecompare(theDate, firstCustWeekdayOfYear) lt 0) {
		firstDayOfYear = createdate(year(theDate)-1, 1, 1);
		firstCustWeekdayOfYear = dateadd('d', firstDayOfWeek-dayofweek(firstDayOfYear), firstDayOfYear);
	}
	custWeekNum = ceiling(datediff('d', firstCustWeekdayOfYear, theDate)/7);
	if (NOT custWeekNum) custWeekNum = 1;
	if (arraylen(arguments) gte 3 AND arguments[3]) {
		return numberformat(custWeekNum + year(firstCustWeekdayOfYear)/(1 & repeatstring(0, len(year(firstCustWeekdayOfYear)))), '^.' & repeatstring(0, len(year(firstCustWeekdayOfYear)))); //return weeknumber and year as WW.YYYY 
	} else {
		return custWeekNum; //return weeknumber only
	}
}