function weekInMonth() {
  var theDate = Now();
  
  if(arrayLen(arguments)) theDate = arguments[1];
  return  week(theDate) - week(createDate(year(theDate),month(theDate),1)) + 1;
}