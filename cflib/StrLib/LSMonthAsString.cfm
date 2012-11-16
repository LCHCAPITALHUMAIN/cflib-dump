function LSMonthAsString(month_number) {
	VAR d=CreateDate(2000, month_number, 1);
	VAR oldlocale = "";
	VAR tempstr = "";
	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"mmmm");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"mmmm");
	}
	return tempstr;
}