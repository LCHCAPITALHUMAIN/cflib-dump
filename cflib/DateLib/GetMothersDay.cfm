//Mother's:second sunday in may
function GetMothersDay()
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,5,GetNthOccOfDayInMonth(2,1,5,TheYear));
}