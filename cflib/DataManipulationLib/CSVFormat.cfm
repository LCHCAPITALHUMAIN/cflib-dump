function CSVFormat(query) {
  var returnValue = ArrayNew(1);
  var rowValue = '';
  var columns = query.columnlist;
  var qualifier = '';
  var i = 1;
  var j = 1;
  if(ArrayLen(Arguments) GTE 2) qualifier = Arguments[2];
  if(ArrayLen(Arguments) GTE 3 AND Len(Arguments[3])) columns = Arguments[3];
  returnValue[1] = ListQualify(columns, qualifier);
  ArrayResize(returnValue, query.recordcount + 1);
  columns = ListToArray(columns);
  for(i = 1; i LTE query.recordcount; i = i + 1)
  {
    rowValue = ArrayNew(1);
    ArrayResize(rowValue, ArrayLen(columns));
    for(j = 1; j LTE ArrayLen(columns); j = j + 1)
      rowValue[j] = qualifier & query[columns[j]][i] & qualifier;
    returnValue[i + 1] = ArrayToList(rowValue);
  }		
  returnValue = ArrayToList(returnValue, Chr(13));
  return returnValue;
}