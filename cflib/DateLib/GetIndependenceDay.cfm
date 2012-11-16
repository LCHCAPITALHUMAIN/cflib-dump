// Independence Day: July 4
function GetIndependenceDay() {
	Var TheYear=Year(Now());
  	if(ArrayLen(Arguments)) 
  	  TheYear = Arguments[1];
	return CreateDate(TheYear,7,4);
}