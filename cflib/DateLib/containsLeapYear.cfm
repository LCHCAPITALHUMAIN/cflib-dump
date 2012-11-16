function containsLeapYear(startDate, endDate) {
	// Build offsets
	var StartDateYearOffset = DateAdd("yyyy", 1, startDate);
	var StartDateYearOffsetInDays = DateDiff("d", startDate, StartDateYearOffset);
	var EndDateYearOffset = DateAdd("yyyy", 1, Trim(endDate));
	var EndDateYearOffsetInDays = DateDiff("d", endDate, EndDateYearOffset);

	// Return result
	return IIf(StartDateYearOffsetInDays - EndDateYearOffsetInDays GT 0, DE("true"), DE("false"));
}