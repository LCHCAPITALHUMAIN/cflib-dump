function phoneFormat(varInput) {
       var curPosition = "";
       var i = "";
       var varMask = "(xxx) xxx-xxxx";
       var newFormat = "";
       var startpattern = "";
   if (arrayLen(arguments) gte 2){ varMask = arguments[2]; }
       newFormat = trim(ReReplace(varInput, "[^[:digit:]]", "", "all"));
       startpattern = ReReplace(ListFirst(varMask, "- "), "[^x]", "", "all");
       if (Len(newFormat) gte Len(startpattern)) {
               varInput = trim(varInput);
               newFormat = " " & reReplace(varInput,"[^[:digit:]]","","all");
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
               for (i=1; i lte len(trim(varmask)); i=i+1) {
                       curPosition = mid(varMask,i,1);
                       if(curPosition neq "x") newFormat = insert(curPosition,newFormat, i-1) & " ";
               }
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
       }
       return trim(newFormat);
}