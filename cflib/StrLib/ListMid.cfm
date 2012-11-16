function ListMid(list, startPos, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var finish = startPos+numElements;
  if (ArrayLen(arguments) gt 3)
    delimiter = arguments[4];
  if (startPos+numElements gt ListLen(list, delimiter))
    finish = ListLen(list, delimiter)+1;
  for (i=startPos; i LT finish; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}