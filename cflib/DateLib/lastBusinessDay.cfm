function LastBusinessDayOfMonth(strMonth) {
	var strYear=Year(Now());
	var busDay = false;
	var tempDate = "";

	if (ArrayLen(Arguments) gt 1) strYear=Arguments[2];

	tempDate = DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
	
	while (busDay eq false) {
  		
   		if (dayOfWeek(tempDate) GTE 2 AND dayOfWeek(tempDate) LTE 6) return tempDate;
  		else {
  			tempDate = DateAdd("d",-1,tempDate);
			busDay = false;
  		}
	}
	
}