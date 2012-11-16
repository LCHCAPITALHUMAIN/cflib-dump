function lastDayOfWeek() {
     var NumberOfDays="";
     var LastDayOfWeek = "";
     if(arrayLen(arguments) is 0) arguments.date = now();
     else arguments.date = arguments[1];
     date = trim(arguments.date);
	
     NumberOfDays = 7 - dayOfWeek(date);

     LastDayOfWeek = dateAdd("d", NumberOfDays, date);
    
     return LastDayOfWeek;
}