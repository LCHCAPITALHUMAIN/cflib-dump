function queryColumnsToStruct(query,keyColumn){
       var valueColumn = keyColumn;
       var reverse = false;
       var retainSort = false;
       var struct = structNew();
       var increment = 1;
       var ii = 1;
       var rowsGotten = 0;
       if(arrayLen(arguments) GT 2) valueColumn = arguments[3];
       if(arrayLen(arguments) GT 3) reverse = arguments[4];
       if(arrayLen(arguments) GT 4) retainSort = arguments[5];
       if(retainSort){
               struct = CreateObject("java", "java.util.LinkedHashMap").init();
       }
       if(reverse){
               ii = query.recordCount;
               increment = -1;
       }
       while(rowsGotten LT query.recordCount){
               struct[query[keyColumn][ii]] = query[valueColumn][ii];
               ii = ii + increment;
               rowsGotten = rowsGotten + 1;
       }
       return struct;
}