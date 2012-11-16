function DifferentMonth(date1, date2) {
	return ( ( Month(date1) NEQ Month(date2) ) OR ( Year(date1) NEQ Year(date2) ) );
}