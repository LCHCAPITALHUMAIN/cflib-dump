function timeRoundUpToNextSecond(datetime){
	// Declare our local variables
	var lDiff = 0;	
	
	// Correct for rounding error. If the milliseconds are something like .997,
	// I am asserting (assuming?) that the actual time is really the next second.
	// Why bother? I have Excel worksheets where the datetime is "4/13/09 17:00"
	// but when brought into CF via POI, it gets turned into "4/13/09 16:59:59"
	
	if(datePart("l", datetime) gte 997)
		{
		lDiff = 1000 - datePart("l", datetime);
		lDiff = lDiff / 1000;
		lDiff = lDiff + 1;
		datetime = dateAdd("s",lDiff,datetime); 
	};

	return datetime;
}