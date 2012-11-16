function getTimeFromSeconds(seconds) {
	var timehr = "";
	var timemin = "";
	var timesec = "";
	
	//roll days
	if(seconds gt 86400) seconds = seconds-((seconds \ 86400) * 86400);

	TimeHr = (((seconds\3600)-1) Mod 24)+1; /* find hour */
	TimeMin = seconds\60-(seconds\3600)*60; /* Find minutes */
	TimeSec = seconds-(TimeHr * 3600) - (TimeMin*60); /* find seconds */
	return createTime(TimeHr,TimeMin,TimeSec); /* Create time (no date) */