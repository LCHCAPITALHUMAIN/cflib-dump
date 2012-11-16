function requestInOut() {
                var orderList = "url,form,flash";
                var i = 0;

                // if request.IN does not exist, create it
                if(not isDefined("request.IN")) {request.IN = structNew();}
                if(not isDefined("request.OUT")) {request.OUT = structNew();}

                if(arrayLen(arguments) gte 1) orderList = arguments[1];

                for (i=1;i lte listLen(orderList); i = i+1){
                        switch( UCase(listGetAt(orderList,i))) {
                                case "URL": {
                                        structAppend(request.IN,URL); // add URL
                                        break;
                                }

                                case "FORM": {
                                        structAppend(request.IN,FORM); // add FORM
                                        break;
                                }

                                case "FLASH": {
                                        if (IsDefined("FLASH")) structAppend(Request.IN,FLASH); // add FLASH
                                        break;
                                }
                        } //end switch
                } // end for

                if(not structIsEmpty(request.IN)) {
                        request.IN.FIELDNAMES = ""; // make sure fieldnames exist and is empty
                        request.IN.FIELDNAMES = structKeyList(request.IN); // make list of fieldnames
                        // then remove FIELDNAMES itself as a fieldname
                        request.IN.FIELDNAMES = listDeleteAt(request.IN.FIELDNAMES, listFindNoCase(request.IN.FIELDNAMES,"FIELDNAMES"));
                        return TRUE; // function end, input normalized
                }
                else return FALSE; // function end, nothing to normalize

}