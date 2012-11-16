function listCountUnique(lst) {
  var i         = 0;
  var delim     = ",";
  var countList = "";
  var lstArray  = "";

  if (arrayLen(arguments) gt 1) delim = arguments[2];
	
  lstArray = listToArray(lst,delim);
	
  for (i = 1; i LTE arrayLen(lstArray); i = i + 1) {
    if (listFind(countList,lstArray[i],delim) eq 0) {
      countList=listAppend(countList,lstArray[i]);
    }
  }

  return listLen(countList);
}