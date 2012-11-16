function ListLeft(list, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  if (ArrayLen(arguments) gt 2){
    delimiter = arguments[3];
  }
  if (numElements gte ListLen(list, delimiter)){
    return list;
  }
  for (i=1; i LTE numElements; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}