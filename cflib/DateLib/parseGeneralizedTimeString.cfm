function parseGeneralizedTimeString(timeString){
	// This function expects a generalize time string in the following format: 19880923191500.0Z

	// Return the parsed date/time object.
	return parseDateTime(left(arguments.timeString, 4) & "-" & mid(arguments.timeString, 5, 2) & "-" & mid(arguments.timeString, 7, 2) & " " & mid(arguments.timeString, 9, 2) & ":" & mid(arguments.timeString, 11, 2) & ":" & mid(arguments.timeString, 13, 2));
}