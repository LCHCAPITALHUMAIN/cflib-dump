//Election Day: Tuesday after First Monday in November, in even numbered years.
// for odd numbered years, -1 is returned
function GetElectionDay() {
 Var TheYear=Year(Now());
 if(ArrayLen(Arguments)) 
   TheYear = Arguments[1];
 if(TheYear MOD 2 eq 0){ 
   return DateAdd("d",1,CreateDate(TheYear,11,GetNthOccOfDayInMonth(1,2,11,TheYear))); //add 1 day to first monday
	} 
  else {
    return -1;
  }
}