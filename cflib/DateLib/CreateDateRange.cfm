function CreateDateRange(startdate,ndays) {
  var dtarray = arraynew(1);
  var i = 1;
  var ndate = "";
  var dtformat = "mm/dd/yyyy";
  
  if (ArrayLen(arguments) gte 3) dtformat = arguments[3];
  ndate = dateformat(startdate,"mm/dd/yyyy") - 1;
  for(i = 1; i lte ndays; i = i+1) {
    ndate = dateformat(ndate+1,dtformat);
    arrayappend(dtarray, ndate);
  }
  return dtarray;
}