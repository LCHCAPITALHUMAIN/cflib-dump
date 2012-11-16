// Good Friday: Friday before Easter
function GetGoodFriday() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return DateAdd("D",-2,GetEaster(TheYear));
}