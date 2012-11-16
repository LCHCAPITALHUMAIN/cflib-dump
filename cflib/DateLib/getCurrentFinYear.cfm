function getCurrentFinYear(mask) {
 	var finYear = "";
	var partOne = "";
	var partTwo = "";
	var date = now();

	if(arrayLen(arguments) gte 2) date = arguments[2];
	
	// if the current month falls in the first 6 months of the year...
	if (month(date) lte 6) {
		// first part is last year
		partOne = year(dateAdd("yyyy", -1, date));
		// second part is this year
		partTwo = year(date);
	} else {
		// first part is this year
		partOne = year(date);
		// second part is next year
		partTwo = year( dateAdd("yyyy", 1, date) );
	}
	// replace mask tokens for return
	finYear = replaceNoCase(mask,"y1",partOne);
	finYear = replaceNoCase(finYear,"y2",partTwo);
	
	return finYear;
}