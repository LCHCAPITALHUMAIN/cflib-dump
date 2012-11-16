function MySQLDT2TS(dt) {
	return Year(dt) & NumberFormat(Month(dt),'00') & NumberFormat(Day(dt),'00') & NumberFormat(Hour(dt),'00') & NumberFormat(Minute(dt),'00') & NumberFormat(Second(dt),'00');
}