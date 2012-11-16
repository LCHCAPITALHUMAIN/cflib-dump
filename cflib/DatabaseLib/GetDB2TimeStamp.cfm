function getDB2TimeStamp(dateObj, emulateTick)
{
	var tick = "000000";
	// We can partially emulate milliseconds by 
	//grabbing the current tick and applying it to the date object
	if(emulateTick IS "Yes")
		tick = Right(GetTickCount(),3) & "000";
		
	return DateFormat(dateObj, "yyyy-mm-dd-") & TimeFormat(dateObj, "HH.mm.ss.") & tick; 
}