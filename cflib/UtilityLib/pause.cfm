function pause(TimeDelay) {
	
	//Gets the time the function starts processing for output purposes
	var StartTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	//Converts the start time to seconds 
	var StartTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now());
	//Sets the delay equal to the startTime plus the amount of seconds passed to the function
	var Delay = StartTimeInSeconds + TimeDelay;
	//Makes the EndTime and CurrTimeInSeconds variable private to this function
	var EndTime = "";
	var CurrTimeInSeconds = "";
	var debugmode = false;
	
	if(arrayLen(arguments) gte 2) debugmode = arguments[2];

	//Start Loop
	do { 
		//Calculates the current seconds
		CurrTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now()); 
		}
	while(CurrTimeInSeconds neq Delay);
	//Sets the EndTime when the do-while loop has completed
	EndTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	
	//Writes output if DebugMode is true
	if(debugMode) {
		WriteOutput('Start: #StartTime#<br />Paused for #TimeDelay# seconds<br />End: #EndTime#<br />');
	}
	 
}