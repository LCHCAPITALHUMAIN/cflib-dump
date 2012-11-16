function JulianDayofWeek(){
        var date=iif(arraylen(arguments) gt 0,"arguments[1]", "Now()");
	var month = DatePart("m", date);
	var day = DatePart("d", date);
	var year = DatePart("yyyy", date);
	var a = 0;
	var y = 0;
	var m = 0;
	var dayOfWeek = 0;
	a = (14 - month) \ 12;
	y = year - a;
	m = month + 12*a - 2;
	// for Julian calendar:
	dayOfWeek = ((5 + day + y + y\4 + (31*m)\12) mod 7)+1;

	// for Gregorian calendar:
	if(arraylen(arguments) EQ 0){
		dayOfWeek = DayofWeek(date);
	}

	return dayOfWeek;
}