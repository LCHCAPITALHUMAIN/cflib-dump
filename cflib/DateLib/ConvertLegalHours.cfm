function ConvertHours(HourString) {
	var HourWords = "";
	var MinuteVal = Round(val(listGetAt(HourString,2,":"))/6);
	var HourVal = listFirst(hourString,":");
	
	if(len(HourVal) is 1) {
		if(HourVal is "0") HourWords = '0.';
		else HourWords = HourVal & '.';
	} else HourWords = HourVal & '.';
	
	HourWords = HourWords & MinuteVal;
	return HourWords;
}