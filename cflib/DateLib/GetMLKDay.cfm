function GetMLKDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,1,GetNthOccOfDayInMonth(3,2,1,TheYear));
}