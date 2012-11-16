function GetPercentile(pctile, range) {
  var rangeArr = ListToArray(range);
  var rangepoint = "";
  pctile = pctile * .01;
  ArraySort(rangeArr, "numeric");
  rangePoint = Max(Round(ArrayLen(rangeArr)*pctile), 1);
  return rangeArr[rangePoint]; 
}