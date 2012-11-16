function getDaylightSavingTimeEnd() {
	var TheYear=Year(Now());
  	if(ArrayLen(Arguments)) TheYear = Arguments[1];
	//US Congress changed it for 2007,may switch back
	// From last Sunday in October to First Sunday in November 
	if(TheYear lt 2007) return CreateDate(TheYear,10,GetLastOccOfDayInMonth(1,10,TheYear));
	else return CreateDate(TheYear,11,GetNthOccOfDayInMonth(1,1,11,TheYear));
	return CreateDate;
}