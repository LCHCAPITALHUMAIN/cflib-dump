Function Decimal2Sexagesimal(pCoordinate) {
	var pCoordinatePart = "";
	var myDegrees = "";
	var myMinutes = "";
	var mySeconds = "";
	var retval = "";
	
	myDegrees = Int(pCoordinate);
	myMinutes = (pCoordinate - Int(pCoordinate)) * 60;
	mySeconds = (myMinutes - Int(myMinutes)) * 60;
	
	mySeconds = Round(mySeconds * 10000) / 10000;
	
	if (mySeconds eq 60) {
		myMinutes = myMinutes + 1;
		if (myMinutes eq 60) {
			myDegrees = myDegrees + 1;
			myMinutes = 0;
		}
		mySeconds = 0;
	}
	
	retval = myDegrees & chr(176) & " " & Int(myMinutes) & "' " & mySeconds & chr(34);
	
	if (ArrayLen(Arguments) gt 1) {
	
		pCoordinatePart = Arguments[2];
		
		if (pCoordinatePart eq "degree" or pCoordinatePart eq "degrees" or pCoordinatePart eq 1)
			retval = myDegrees;
		else if (pCoordinatePart eq "minute" or pCoordinatePart eq "minutes" or pCoordinatePart eq 2)
			retval = Int(myMinutes);
		else if (pCoordinatePart eq "second" or pCoordinatePart eq "seconds" or pCoordinatePart eq 3)
			retval = mySeconds;
			
	}
	
	return retval;

}