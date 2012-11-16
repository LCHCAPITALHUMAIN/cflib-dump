function ISOWeek(inputDate) {  
    var d = StructNew();
	var d2 = 0;
	var days = 0;
	d.yday = DayOfYear(inputDate);
	d.wday = DayOfWeek(inputDate)-1;
	d.year = Year(inputDate);
    days = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
    if(days LT 0) {
        d.yday = d.yday + 365 + isLeapYear(d.year-1);
        days = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
    } else {
        d.yday = (d.yday - 365) + isLeapYear(d.year);
        d2 = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
        if (0 LTE d2) {
            days = d2;
        }
    }
	return int((days / 7) + 1);
}