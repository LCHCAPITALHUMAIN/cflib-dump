//Columbus Day:second monday in september
function GetColumbusDay()
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,10,GetNthOccOfDayInMonth(2,2,10,TheYear));
}