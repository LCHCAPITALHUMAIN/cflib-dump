//Presidents Day:third monday in february
function GetPresidentsDay() {
	Var TheYear=Year(Now());
  	if(ArrayLen(Arguments)) 
  	  TheYear = Arguments[1];
	return CreateDate(TheYear,2,GetNthOccOfDayInMonth(3,2,2,TheYear));
}