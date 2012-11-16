function DifferentDay(date1, date2) {
	return ( ( DayOfYear(date1) NEQ DayOfYear(date2) ) OR ( Year(date1) NEQ Year(date2) ) );
}