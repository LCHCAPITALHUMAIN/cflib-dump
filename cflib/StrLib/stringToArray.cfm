function stringToArray(string, count) {
   var array = arrayNew(1);
   
   while (len(string)) {
      arrayAppend(array, left(string, min(count, len(string))));
      
      if ((len(string) / count) gt 1) string = right(string, len(string) - count);
      else string = "";
   }

   return array;
}