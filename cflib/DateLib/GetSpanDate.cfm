function GetSpanDate(dateObj, days, hours, minutes, seconds){
  var timeDiff = CreateTimeSpan(days, hours, minutes, seconds);
  var spanDate = dateObj+timeDiff;
  return "{ts '" & DateFormat(spanDate, "yyyy-mm-dd ") & TimeFormat(spanDate, "HH:mm:ss") & "'}";
}