function GetLastOccOfDayInMonth(TheDayOfWeek,TheMonth,TheYear) 
{
  //Find The Number of Days in Month
  Var TheDaysInMonth=DaysInMonth(CreateDate(TheYear,TheMonth,1));
  //find the day of week of Last Day
  Var DayOfWeekOfLastDay=DayOfWeek(CreateDate(TheYear,TheMonth,TheDaysInMonth));
  //subtract DayOfWeek
  Var DaysDifference=DayOfWeekOfLastDay - TheDayOfWeek;
  //Add a week if it is negative
  if(DaysDifference lt 0){
    DaysDifference=DaysDifference + 7;
  }
  return TheDaysInMonth-DaysDifference;
}