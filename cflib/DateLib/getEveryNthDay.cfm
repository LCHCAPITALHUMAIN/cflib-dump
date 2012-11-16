function getEveryNthDay(dow,nth,yy) {
	var containerArray = arrayNew(1);
	
	var mm 			= "";
	var dd 			= "";
	var startDate	= "";
	var dateFound	= 0;
	
	if (val(dow) LT 1 OR val(dow) GT 7) return false;
	
	for (mm=1; mm LTE 12; mm=mm+1) {
		dateFound = 0;
		for (dd=1; dd LTE daysInMonth(createDate(yy, mm, 1)); dd=dd+1) {
			startDate = createDate(yy, mm, dd);
			if (dayOfWeek(startDate) EQ dow) {
				dateFound = dateFound + 1;
				if (dateFound EQ nth) arrayAppend(containerArray, startDate);
			}
		}
	}
	
	return containerArray;
}