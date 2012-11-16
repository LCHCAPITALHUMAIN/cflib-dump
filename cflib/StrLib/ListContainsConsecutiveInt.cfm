function ListContainsConsecutiveInt(lsIncoming){
  var arrSorted=ArrayNew(1);
  var i=0;
  var strDelimiter=",";

 //default list delimiter to a comma unless otherwise specified
 if(ArrayLen(arguments) gte 2){
  strDelimiter=arguments[2];
 }
  //change list to array for faster processing
  arrSorted=ListToArray(lsIncoming,strDelimiter);
  //make sure all array elements are numeric and itegers
  for(i=1; i lte ArrayLen(arrSorted); i=i+1){
    if(not isNumeric(arrSorted[i]) or round(arrSorted[i]) is not arrSorted[i]){
      return false;
    }
  }
  //sort the array
  arraySort(arrSorted,"numeric");
  //loop sorted array
  for(i=0; i lt ArrayLen(arrSorted); i=i+1){
    //see if item at array position i+1 equals the first array element + i
    if(arrSorted[i+1] neq arrSorted[1]+i){
      return false;
      break;
    }
  }
  return true;
}