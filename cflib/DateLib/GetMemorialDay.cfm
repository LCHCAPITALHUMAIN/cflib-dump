//Memorial Day:last monday in may
function GetMemorialDay()
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,5,GetLastOccOfDayInMonth(2,5,TheYear));
}