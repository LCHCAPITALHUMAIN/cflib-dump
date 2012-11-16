function GMTDateFormat (adate,offset) {
     // adate must be a valid date time object.
     // the offset must be in the format -0000 or +0000.
     
     var dvalue = ""; // the final value.
     
     if (IsDate(adate)) {
          
          dvalue = DateAdd('h',Left(offset,3),DateAdd('s',Left(offset,1) & Right(offset,2),adate));
          dvalue = Left( DayOfWeekAsString( DayOfWeek( dvalue ) ), 3) & 
                  ', ' & 
                  DateFormat(dvalue,'dd mmm yyyy') &
                  ' ' &
                  TimeFormat(dvalue,'HH:mm:ss') &
                  ' GMT';
          
          return dvalue;
     }
     
     else { return; }
}