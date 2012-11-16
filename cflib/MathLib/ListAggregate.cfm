function listAggregate(list) {
  var a=1;
  var sum=0;
  var sumList="";
  var delims=",";
  if (arrayLen(arguments) gte 2) {
    delims = arguments[2];
  }
    for ( ;a lte listLen(list,delims);a=a+1) {
      sum = sum + val(listGetAt(list,a,delims));
      sumList = ListAppend(sumList,sum,delims);
    }
  return sumList;
}