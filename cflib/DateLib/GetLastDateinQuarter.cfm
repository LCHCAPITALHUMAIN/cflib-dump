function GetLastDateinQuarter(quarter){
	switch(quarter){
		case 1:
			return CreateDate(year(now()), 3, DaysInMonth(CreateDate(year(now()),3,1)));
			break;
		case 2:
			return CreateDate(year(now()), 6, DaysInMonth(CreateDate(year(now()),6,1)));
			break;
		case 3:
			return CreateDate(year(now()), 9, DaysInMonth(CreateDate(year(now()),9,1)));
			break;
		case 4:
			return CreateDate(year(now()), 12, DaysInMonth(CreateDate(year(now()),12,1)));
			break;
	}
}