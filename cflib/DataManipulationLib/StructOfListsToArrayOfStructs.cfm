function StructOfListsToArrayOfStructs(Struct){
   var delim = ",";
   var theArray = arraynew(1);
   var row = 1;
   var i = ""; 
   var cols = structkeyarray(Struct);
   var count = 0;
   var value = ""; 
   var strow = "";

   if(arrayLen(arguments) GT 1) delim = arguments[2];
   if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
   count = listlen(struct[cols[1]],delim);
   if(arraylen(cols) gt 0) {
      for(row=1; row LTE count; row = row + 1){
      strow = structnew();
      for(i=1; i lte arraylen(cols); i=i+1) {
         if(structKeyExists(Struct,cols[i])){
            if(listlen(Struct[cols[i]],delim) gte row){
               value = listgetat(Struct[cols[i]],row,delim);
            }else{
               value = "";
            }
         }else{
            value = "";
         }
         strow[cols[i]] = value;
      }
      arrayAppend(theArray,strow);
      }
   }
   return theArray;
}