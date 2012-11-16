function justNumericList(nList) {
   var intIndex = 0;
   var aryN = arrayNew(1);
   var strDelim = ",";
   var result = arrayNew(1);
   if (arrayLen(arguments) gte 2) strDelim = arguments[2];
   aryN = listToArray(nlist,strDelim);
   for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=intIndex+1) {
    if (not compare(val(aryN[intIndex]),aryN[intIndex])) arrayAppend(result, aryN[intIndex]);
   }
   return arrayToList(result,strDelim);
}