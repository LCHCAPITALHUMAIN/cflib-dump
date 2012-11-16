<cffunction name="quickSort" hint="Implementation of quicksort" access="public" returntype="array" output="false">
       <cfargument name="arrayToCompare" hint="The array to compare" type="array" required="Yes">
       <cfargument name="sorter" hint="UDF for comparing items" type="any" required="Yes">
       <cfscript>
               var lesserArray  = ArrayNew(1);
               var greaterArray = ArrayNew(1);
               var pivotArray   = ArrayNew(1);
               var examine      = 2;
               var comparison = 0;

               pivotArray[1]    = arrayToCompare[1];

               if (arrayLen(arrayToCompare) LT 2) {
                       return arrayToCompare;
               }

               while(examine LTE arrayLen(arrayToCompare)){
                       comparison = arguments.sorter(arrayToCompare[examine], pivotArray[1]);
                       switch(comparison) {
                               case "-1": {
                                       arrayAppend(lesserArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "0": {
                                       arrayAppend(pivotArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "1": {
                                       arrayAppend(greaterArray, arrayToCompare[examine]);
                                       break;
                               }
                       }
                       examine = examine + 1;
               }

               if (arrayLen(lesserArray)) {
                       lesserArray  = quickSort(lesserArray, arguments.sorter);
               } else {
                       lesserArray = arrayNew(1);
               }

               if (arrayLen(greaterArray)) {
                       greaterArray = quickSort(greaterArray, arguments.sorter);
               } else {
                       greaterArray = arrayNew(1);
               }

               lesserArray.addAll(pivotArray);
               lesserArray.addAll(greaterArray);

               return lesserArray;
       </cfscript>
</cffunction>