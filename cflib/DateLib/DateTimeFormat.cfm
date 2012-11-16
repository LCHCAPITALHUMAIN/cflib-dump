function DateTimeFormat(time) {
	var str = "";
	var dateFormat = "mmmm d, yyyy";
	var timeFormat = "h:mm tt";
	var joinStr = " ";
	
	if(ArrayLen(Arguments) gte 2) dateFormat = Arguments[2];
	if(ArrayLen(Arguments) gte 3) timeFormat = Arguments[3];
	if(ArrayLen(Arguments) gte 4) joinStr = Arguments[4];

	return DateFormat(time, dateFormat) & joinStr & TimeFormat(time, timeFormat);
}