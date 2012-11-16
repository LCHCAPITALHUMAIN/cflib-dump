// Thanksgiving Day 4th thursday in november
function GetThanksgivingDay() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];

  return CreateDate(TheYear,11,GetNthOccOfDayInMonth(4,5,11,TheYear));
}