function QuarterHour(minutes) {
	var mixedFraction = "";
	var hours = 0;
	var quarterHours = 0;
	
	/* Get hours and let minutes be the remainder */
	hours = Int(minutes/60);
	minutes = minutes - hours*60;

	/* 15 minutes is a "quarter hour" - round up to the nearest one */
	quarterHours = Round(minutes/15);
	if(quarterHours GTE 4) {
		quarterHours = 0;
		hours = IncrementValue(hours);
	}

	/* Build the mixed fraction */
	if(quarterHours GT 0) {
		if(quarterHours EQ 2) mixedFraction = ' 1/2';
		else mixedFraction = ' ' & quarterHours & '/4';
	} else mixedFraction = '';

	mixedFraction = hours & mixedFraction;
	return mixedFraction;
}