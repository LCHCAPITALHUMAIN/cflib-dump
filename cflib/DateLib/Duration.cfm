function Duration(dateObj1, dateObj2){
       var dateStorage = dateObj2;
       var DayHours = 0;
       var DayMinutes = 0;
       var HourMinutes = 0;
       var timeStruct = structNew();

       if (DateCompare(dateObj1, dateObj2) IS 1)       {
                       dateObj2 = dateObj1;
                       dateObj1 = dateStorage;
       }

       timeStruct.days = DateDiff("d",dateObj1,dateObj2);
       DayHours = timeStruct.days * 24;
       timeStruct.hours = DateDiff("h",dateObj1,dateObj2);
       timeStruct.hours = timeStruct.hours - DayHours;

       DayMinutes = timeStruct.days * 1440;
       HourMinutes = timeStruct.hours * 60;
       timeStruct.minutes = DateDiff("n",dateObj1,dateObj2);
       timeStruct.minutes = timeStruct.minutes - (DayMinutes + HourMinutes);

       DayMinutes = timeStruct.days * 86400;
       HourMinutes = (timeStruct.hours * 3600) + (timeStruct.minutes * 60);
       timeStruct.seconds = DateDiff("s",dateObj1,dateObj2);
       timeStruct.seconds = timeStruct.seconds - (DayMinutes + HourMinutes);
       return timeStruct;
}