public string function convertSecondsToTimeString( required numeric timeInSeconds, string workingHoursPerDay=24 ){
	// create a struct containing placeholder values for days, hours and minutes
	var timeStruct = { days=0, hours=0, minutes=0 };
	
	// create a variable to store the return value
	var timeAsString = "";
	
	// convert the number of working hours per day to seconds
	var workingSecondsPerDay = arguments.workingHoursPerDay * 3600;
	
	timeInSeconds = int(timeInSeconds); // will give unpredictable results if this is a float
	
	// calculate the number of whole working days and add to the 'days' element of our structure
	timeStruct.days = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod workingSecondsPerDay ) ) / workingSecondsPerDay;
	arguments.timeInSeconds = timeInSeconds mod workingSecondsPerDay;
	
	// calculate the number of hours and add to the 'hours' element of our structure
	timeStruct.hours = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod 3600 ) ) / 3600;
	arguments.timeInSeconds = arguments.timeInSeconds mod 3600;
	 
	// calculate the number of minutes and add to the 'minutes' element of our structure
	timeStruct.minutes = arguments.timeInSeconds / 60;
	
	// build the return string
	if( val( timeStruct.days ) ) timeAsString = timeStruct.days & "d ";
	if( val( timeStruct.hours ) ) timeAsString &= timeStruct.hours & "h ";
	if( val( timeStruct.minutes ) ) timeAsString &= timeStruct.minutes & "m";
	
	// return the string
	return trim( timeAsString );
}