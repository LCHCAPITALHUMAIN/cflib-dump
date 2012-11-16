public numeric function convertTimeStringToSeconds( required string timeAsString, string workingHoursPerDay=24 ){
	// create a struct containing placeholder values for days, hours and minutes
	var timeStruct = { days=0, hours=0, minutes=0 };
	
	// create a variable to store the return value
	var timeInSeconds = "";
	
	// check the timeAsString argument has a length
	if( listLen( trim( arguments.timeAsString ), " " ) ){
		// loop through the values in the timeAsString argument
		for ( var i=1; i lte listLen( arguments.timeAsString, " " ); i=i+1 ){
			// if the current value ends in 'd' add the value to the 'days' element of our structure 
			if( right( listGetAt( arguments.timeAsString, i, " " ), 1 ) eq "d" ) {
				timeStruct.days = val( listGetAt( arguments.timeAsString, i, " " ) );
			// if the current value ends in 'h' add the value to the 'hours' element of our structure 
			}else if( right( listGetAt( arguments.timeAsString, i, " " ), 1 ) eq "h" ){
				timeStruct.hours = val( listGetAt( arguments.timeAsString, i, " " ) );
			// if the current value ends in 'm' add the value to the 'minutes' element of our structure 
			}else if( right( listGetAt( arguments.timeAsString, i, " " ), 1 ) eq "m" ){
				timeStruct.minutes = val( listGetAt( arguments.timeAsString, i, " " ) );
			}
		}
		
		// convert each of the structure elements to seconds and add them
		timeInSeconds = 
		( timeStruct.days * ( arguments.workingHoursPerDay * 3600 ) )
		+ ( timeStruct.hours * 3600 )
		+ ( timeStruct.minutes * 60 );
	}
	
	// return the time in seconds
	return timeInSeconds;
}