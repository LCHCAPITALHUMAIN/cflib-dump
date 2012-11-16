//Father's:third sunday in june
function GetFathersDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,6,GetNthOccOfDayInMonth(3,1,6,TheYear));
}