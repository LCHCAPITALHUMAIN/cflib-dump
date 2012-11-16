//Labor Day:first monday in september
function GetLaborDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,9,GetNthOccOfDayInMonth(1,2,9,TheYear));
}