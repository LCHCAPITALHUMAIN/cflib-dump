function getDaylightSavingTimeStart() {
	var TheYear=Year(Now());
  	if(ArrayLen(arguments)) TheYear = arguments[1];
	//US Congress changed it for 2007,may switch back
	// From first Sunday in April to Second Sunday in March 
	if(TheYear lt 2007) return CreateDate(TheYear,4,GetNthOccOfDayInMonth(1,1,4,TheYear));
	else return CreateDate(TheYear,3,GetNthOccOfDayInMonth(2,1,3,TheYear));
}