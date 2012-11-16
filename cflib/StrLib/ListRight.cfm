function ListRight(list, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var totalLen=0;
  if (ArrayLen(arguments) gt 2){
    delimiter = arguments[3];
  }
  if (numElements gt ListLen(list, delimiter)){
    return list;
  }
  totalLen=ListLen(list, delimiter);
  for (i=(totalLen-numElements)+1; i LTE totalLen; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}