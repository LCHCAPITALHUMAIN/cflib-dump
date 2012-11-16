function listToStruct(list){
       var myStruct = StructNew();
       var i = 0;
       var delimiter = ",";
       var tempList = arrayNew(1);
       if (ArrayLen(arguments) gt 1) {delimiter = arguments[2];}
       tempList = listToArray(list, delimiter);
       for (i=1; i LTE ArrayLen(tempList); i=i+1){
               if (not structkeyexists(myStruct, trim(ListFirst(tempList[i], "=")))) {
                       StructInsert(myStruct, trim(ListFirst(tempList[i], "=")), trim(ListLast(tempList[i], "=")));
               }
       }
       return myStruct;
}