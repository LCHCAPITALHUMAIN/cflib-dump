function OrderListByList(List1, List2) {
 	var ExtraList = "";
	var ResultList = "";
  	var Delim1 = ",";
  	var Delim2 = ",";
  	var Delim3 = ",";
  	var i = 0;
	var j = 0;
	var o = 1;
	var o2 = 1;
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
	  case 3:
	    {
	      Delim1 = Arguments[3];
	      break;
	    }
	  case 4:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];
	      break;
	    }
	  case 5:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];          
	      Delim3 = Arguments[5];
	      break;
	    }        
	}
	for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1)
	{
		 if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
		 	for(o=1; o LTE ListValueCount(List1, ListGetAt(List2, i, "#Delim2#") , "#Delim1#"); o=o+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
			}
		 }
	}
	for (j=1; j LTE ListLen(List1, "#Delim1#"); j=j+1)
	{
		 if (not ListFindNoCase(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#")){
		 	for(o2=1; o2 LTE ListValueCount(List1, ListGetAt(List1, j, "#Delim1#") , "#Delim1#"); o2=o2+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#");
			}
		 }
	}
	Return ResultList;
 }