function StructOfArraysToStructOfStructs(struct,thekey){ 
   var i = ""; 
   var ii = ""; 
   var new = structNew();
   var value = ""; 
   var cols = "";

   if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
   else cols = structkeyarray(struct); 

   for(i = 1; i lte arraylen(struct[thekey]); i = i + 1){
      new[struct[thekey][i]] = structNew();
      for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
      if(structKeyExists(struct,cols[ii])){
         value = struct[cols[ii]][i];
      }else{
         value = "";
      }
      new[struct[thekey][i]][cols[ii]] = value;
      }
   }
   return new;
}