function GetFiscalYear() {
		var datetime = now();
		var month = month(datetime);
		if (ArrayLen(Arguments) gte 1) {
		if (IsDate(Arguments[1])) {
			datetime = Arguments[1];
			month = month(datetime);
		} else datetime = Now();
		}
		if(month gte 10)
	    	return Year(DateAdd('yyyy', 1, datetime));
		else
		   return Year(datetime);
	}