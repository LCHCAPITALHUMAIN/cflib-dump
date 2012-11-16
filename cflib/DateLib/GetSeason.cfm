function GetSeason() {
	var myDate = iif(arraylen(arguments) gt 0,"arguments[1]", "now()");
	var myYear = Year(myDate);
	//Winter
	var winterStart = '12-21-' & decrementValue(myYear);
	var winterEnd = '03-20-' & myYear;
	//Spring
	var springStart = '3-21-' & myYear;
	var springEnd = '06-20-' & myYear;
	//Summenr 
	var summerStart = '06-21-' & myYear;
	var summerEnd ='09-20-' & myYear;
	//Fall
	var fallStart = '09-21-' & myYear;
	var fallEnd = '12-20-' & myYear;
	
	// return the correct season
	if (myDate GTE winterStart AND myDate LTE winterEnd) {
		return "Winter";
	} else if (myDate GTE springStart AND myDate LTE springEnd) {
		return "Spring";
	} else if (myDate GTE summerStart AND myDate LTE summerEnd) {
		return "Summer";
	} else if (myDate GTE fallStart AND myDate LTE fallEnd) {
		return "Fall";
	} else {
		return "";
	}
}