function GetEpochTime() {
	var datetime = 0;
	if (ArrayLen(Arguments) is 0) {
		datetime = Now();

	}
	else {
		if (IsDate(Arguments[1])) {
			datetime = Arguments[1];
		} else {
			return NULL;
		}
	}
	return DateDiff("s", "January 1 1970 00:00", datetime);
		
		
}