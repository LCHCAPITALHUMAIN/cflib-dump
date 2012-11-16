function ISODayOfWeek(date)
{
  if (DayOfWeek(date) EQ 1) 
    Return 7;
  else 
    Return DayOfWeek(date)-1;
}