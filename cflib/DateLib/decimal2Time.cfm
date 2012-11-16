function decimal2Time(decimal){
	var timeMask = "hh:mm tt"; 
	var timeValue = ""; 
	var decimalMinutes = "";
	var decimalHours = "";

	//make sure passed value is numeric
	if(not isNumeric(decimal)) return "The value passed to function decimalToTime() is not a valid number!";

	timeValue =  numberFormat(decimal,"99.99");
	
	if(timeValue LT 0 OR timeValue GTE 24) return "The value passed to function decimalToTime() is not within the valid range of 0 - 23.99"; 

	//if the optional mask was passed use that otherwise default to "hh:mm tt"
	if(arrayLen(arguments) gt 1) timeMask = arguments[2];
			
	decimalHours = listfirst(timeValue,".");
	decimalMinutes = listLast(timeValue,".");
			
	//attempt to determine minutes 
	if(decimalMinutes neq 0) decimalMinutes = round(60*decimalMinutes/100);
			
	timeValue = timeFormat(decimalHours & ":" & decimalMinutes,timeMask);
	return timeValue;
}