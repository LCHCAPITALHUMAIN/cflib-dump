function DaysTillChristmas() {
	var ChristmasDayOfYearThisYear =
DayofYear(CreateDate(Year(Now()),12,25));
	var ChristmasDayOfYearNextYear =
DayofYear(CreateDate(Year(Now()) + 1,12,25));
	var TodaysDayOfYear = DayofYear(Now());
	var DaysThisYear=DaysInYear(Now());
	  //Christmas coming
	if (ChristmasDayOfYearThisYear gt TodaysDayOfYear){
	   return ChristmasDayOfYearThisYear -
TodaysDayOfYear;
	}
	 //Christmas has passed
	if (TodaysDayOfYear gt ChristmasDayOfYearThisYear){
	 return DaysThisYear-TodaysDayOfYear +
ChristmasDayOfYearNextYear;
	}
		
	return 0;
}