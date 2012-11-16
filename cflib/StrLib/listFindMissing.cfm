function listFindMissing(list) {
  var delim=","; // list delimiter
  var arrToSearch=""; 
  var i=0;
  var j=0;    
  var returnList="";
  if(arrayLen(arguments) GTE 2) delim = arguments[2];
  arrToSearch=listToArray(list,delim);
  for(i=ArrayMin(arrToSearch);i LTE arrayMax(arrToSearch);i=i+1)
    for(j=1;j LTE arrayLen(arrToSearch);j=j+1) 
      if(arrToSearch[j] EQ i)  break;
      else 
        if (j EQ arrayLen(arrToSearch))
          returnList = listAppend(returnList,i,delim);
  return returnList;
}