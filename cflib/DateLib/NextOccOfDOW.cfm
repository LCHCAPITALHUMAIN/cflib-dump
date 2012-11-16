function  NextOccOfDOW()
{
  Var day = DayOfWeek(Now());
  Var dayOffset = 7;
  if(ArrayLen(Arguments)) 
    day = Arguments[1];
  if(Day GT DayOfWeek(Now()))
    dayOffset = 0;
  return DateAdd("d",(dayOffset + (day - DayOfWeek(Now()))),Now());    
}