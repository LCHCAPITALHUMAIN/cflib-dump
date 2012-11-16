function IsWeekDay() {
	var today = Now();
	if(ArrayLen(Arguments)) today = Arguments[1];
	return (DayOfWeek(today) GTE 2 AND DayOfWeek(today) LTE 6);
}