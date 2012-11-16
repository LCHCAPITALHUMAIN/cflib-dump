// Ash Wednesday: Seventh Wednesday before Easter
function GetAshWednesday() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return DateAdd("D",-46,GetEaster(TheYear));
}