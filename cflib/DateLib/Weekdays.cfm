function weekdays(date1,date2){
  //initialize variables
  var wday=0;
  var day=0;
  var numdays=0;
  
  //get total number of days in between days and save it in numdays
  numdays=datediff("d",date1,date2);
  //loop through all the days between the dates.
  for (day=0; day lte numdays; day=day+1){
  
   if(dayofweek(dateadd("d",day,date1)) neq 1 and dayofweek(dateadd("d",day,date1)) neq 7){
   //if the day is neither saturday or sunday add a week day.
   wday=wday+1;}
  } 
 return wday;
 }