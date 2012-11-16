function thisWeek() {
	var dayOrdinal = 0;
	var returnStruct = structNew();
	var current_date = now();
	
	if (arrayLen(arguments)) current_date = arguments[1];
	dayOrdinal = DayOfWeek(current_date);
	
	returnStruct.weekBegin = dateAdd("d",-1 * (dayOrdinal-1), current_date);
	returnStruct.weekEnd = dateAdd("d",7-dayOrdinal, current_date);
	returnStruct.weekNo = Week(returnStruct.weekBegin);
	
	for(i=1; i LTE 7; i=i+1) {
		StructInsert(returnStruct,DayOfWeekAsString(i),dateAdd("d",i-1,returnStruct.weekBegin));
	}
	
	return returnStruct;

}