function GetShift(date, startDate, sequence) {
  var daysDiff = DateDiff("d",startDate,date);
  var key = daysDiff mod listLen(sequence) + 1;
  return listGetAt(sequence,key);
}