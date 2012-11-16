function IsWeekend() {
	var today = Now();
	if(ArrayLen(Arguments)) today = Arguments[1];
	return (DayOfWeek(today) IS 1 OR DayOfWeek(today) IS 7);
}