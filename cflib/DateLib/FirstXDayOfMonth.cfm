function FirstXDayOfMonth(day_number,month_number,year) {
  var start_of_month = CreateDate(year,month_number,1);  // date object of first day for given month/year
  var daydiff = DayOfWeek(start_of_month) - day_number;
  var return_date = "";
  switch(daydiff) {
    case "-1": return_date = DateAdd("d",1,start_of_month); break;
    case "6": return_date = DateAdd("d",1,start_of_month); break;
    case "-2": return_date = DateAdd("d",2,start_of_month); break;
    case "5": return_date = DateAdd("d",2,start_of_month); break;
    case "-3": return_date = DateAdd("d",3,start_of_month); break;
    case "4": return_date = DateAdd("d",3,start_of_month); break;
    case "-4": return_date = DateAdd("d",4,start_of_month); break;
    case "3": return_date = DateAdd("d",4,start_of_month); break;
    case "-5": return_date = DateAdd("d",5,start_of_month); break;
    case "2": return_date = DateAdd("d",5,start_of_month); break;
    case "-6": return_date = DateAdd("d",6,start_of_month); break;
    case "1": return_date = DateAdd("d",6,start_of_month); break;
    default: return_date = start_of_month; break;  // daydiff=0, default to first day in current month
  } //end switch
  return return_date;
}