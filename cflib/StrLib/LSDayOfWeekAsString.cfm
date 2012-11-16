function LSDayOfWeekAsString(day_of_week) {
	//create arbitrary date
	VAR d=CreateDate(2000, 6, 1);
	VAR dow = DayOfWeek(d);
	VAR oldlocale = "";
	VAR tempstr = "";

	if(dow neq day_of_week) d = dateAdd("d",day_of_week-dow,d);

	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"dddd");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"dddd");
	}
	return tempstr;
}