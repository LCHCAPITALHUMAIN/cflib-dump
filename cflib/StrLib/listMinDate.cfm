function listMinDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMinDate = "";
	var i = "";
  
	if(arrayLen(arguments) GTE 2) ThisDelimiter = Arguments[2];

	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMinDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
 		if(DateCompare(ListGetAt(ThisDateList, i, ThisDelimiter), ThisMinDate) IS -1) {
			ThisMinDate = ListGetAt(ThisDateList, i, ThisDelimiter);
	   	}
	  }
  
	return ThisMinDate;
}