// Mardi Gras: Seventh Tuesday before Easter
function GetMardiGras() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return DateAdd("D",-47,GetEaster(TheYear));
}