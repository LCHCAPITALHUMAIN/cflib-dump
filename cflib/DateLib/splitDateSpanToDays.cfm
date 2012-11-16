function splitDateSpanToDays(spanStart, spanEnd){

	var result = arrayNew(1);
	var period = structNew();
	var firstDayStart = now();
	var firstDay = arguments.spanStart;
	var firstDayEnd = createDateTime(year(firstDay), month(firstDay), day(firstDay), 23, 59, 59);
	var currentDay = now();
	var lastDayStart = now();
	var lastDay = arguments.spanEnd;
	var lastDayEnd = createDateTime(year(lastDay), month(lastDay), day(lastDay), 23, 59, 59);
	var daysBetween = 0;
	var i = 0;
	
	if (dayOfYear(firstDay) eq dayOfYear(lastDay)) {
		period = structNew();
		period.start = firstDay;
		period.end = lastDay;
		temp = arrayAppend(result, period);
	}else{
		firstDayStart = createDateTime(year(firstDay), month(firstDay), day(firstDay), 0, 0, 0);
		lastDayStart = createDateTime(year(lastDay), month(lastDay), day(lastDay), 0, 0, 0);
		daysBetween = dateDiff("d", firstDayStart, lastDayStart) - 1;
		
		period = structNew();
		period.start = firstDay;
		period.end = firstDayEnd;
		temp = arrayAppend(result, period);
		
		if (daysBetween gt 0) {
			for (i = 1; i lte daysBetween; i = i + 1) {
				period = structNew();
				currentDay = dateAdd("d", i, firstDayStart);
				period.start = currentDay;
				currentDay = dateAdd("d", i, firstDayEnd);
				period.end = currentDay;
				temp = arrayAppend(result, period);
			}
		}
		
		period = structNew();
		period.start = lastDayStart;
		period.end = lastDay;
		temp = arrayAppend(result, period);
		
	}
	
	return result;
}