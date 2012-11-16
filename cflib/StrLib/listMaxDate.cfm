function listMaxDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMaxDate = "";
	var i = "";
  
	if(ArrayLen(Arguments) GTE 2) ThisDelimiter = Arguments[2];
  
	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMaxDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
		if(DateCompare(ThisMaxDate,  ListGetAt(ThisDateList, i, ThisDelimiter)) IS -1) {
			ThisMaxDate = ListGetAt(ThisDateList, i, ThisDelimiter);
		}
	}
  
	return ThisMaxDate;
}