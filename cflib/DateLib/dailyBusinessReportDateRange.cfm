function dailyBusinessReportDateRange(dateIn) {
	var dateRange = "";
	var dateOut1 = "";
	var dateOut2 = "";
	
	dateIn = dateFormat(dateIn, 'MM/DD/YYYY');
	
	if(dayOfWeek(dateIn) EQ 2) {
		dateOut1 = dateAdd("d",-2,dateIn);
		dateOut2 = dateadd("s",-1,dateAdd("d",1,dateIn));
	} else {
		dateOut1 = dateAdd("d",0,dateIn);
		dateOut2 = dateadd("s",-1,dateAdd("d",1,dateIn));
	}
	dateRange = dateout1 & "," & dateOut2;

	return dateRange;
}