function DateRangeFormat() {
	var format = "long";
	var longformat = "mmmm d, yyyy";
	var shortformat = "m/d/yy";
	var applyformat = longformat;
	var startDate = now();
	var endDate = now();
	var startFormat = DateFormat(startDate,format);
	var endFormat = DateFormat(endDate,format);
	var DateRangeFormat = startFormat;
	
	if (arrayLen(arguments) GTE 1) { startDate = arguments[1]; }
	if (arrayLen(arguments) GTE 2) { endDate = arguments[2]; }
	if (arrayLen(arguments) GTE 3) { format = arguments[3]; }
	
	if(format is not "long" and format is not "short") format = "long";
	if(format is not "long") applyformat = shortformat;
	
	//case one, same month and year
	if(year(startDate) is year(endDate) and month(startDate) is month(endDate)) {
		startFormat = dateFormat(startDate,ReplaceNoCase(applyformat,"y","","All"));
		if(format is "long") {
			endFormat = dateFormat(endDate,ReplaceNoCase(applyformat,"m","","All"));
		} else {
			endFormat = dateFormat(endDate,applyformat);
		}
	} else if(year(startDate) is year(endDate)) {
	//case two, same year
		startFormat = DateFormat(startDate,ReplaceNoCase(applyformat,"y","","All"));
		endFormat = DateFormat(endDate,applyformat);
	} else {
	//case three, different year and month, dont change anything
		startFormat = DateFormat(startDate,applyformat);
		endFormat = DateFormat(endDate,applyformat);
	}

	if (right(trim(startFormat),1) EQ "," or right(trim(startFormat),1) EQ "/") { 
		startFormat = trim(RemoveChars(startFormat,len(trim(startFormat)), 1)); 
	}

	if (arrayLen(arguments) GTE 2 AND startDate NEQ endDate) {
		DateRangeFormat = startFormat & " - " & endFormat;
	} else {
		DateRangeFormat = dateFormat(startDate,applyformat);
	}
	
	return trim(DateRangeFormat);
}