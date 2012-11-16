function businessDaysAdd(date,number) {
  var cAdded = 0;
  var tempDate = date;
  var direction = compare(number,0);
  while (cAdded LT abs(number)) {
	tempDate = dateAdd("d",direction,tempDate);
    if (dayOfWeek(tempDate) GTE 2 AND dayOfWeek(tempDate) LTE 6) {
      cAdded = incrementValue(cAdded);
    }
  }
  return tempDate;
}