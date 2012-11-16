function GetFederalFiscalYear() {
       var datetime = now();
       var month = month(datetime);
       if (ArrayLen(Arguments) gte 1) {
             if (IsDate(Arguments[1])) {
                   datetime = Arguments[1];
                   month = month(datetime);
             } else datetime = Now();
       }
       if (listfind("1,2,3,4,5,6", month)) 
         return Year(datetime);
       else 
         return  Year(DateAdd('yyyy', 1, datetime));
 }