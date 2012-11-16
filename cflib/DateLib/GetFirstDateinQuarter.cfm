function GetFirstDateinQuarter(quarter){
	switch(quarter){
		case 1:
			return CreateDate(year(now()), 1, 1);
			break;
		case 2:
			return CreateDate(year(now()), 4, 1);
			break;
		case 3:
			return CreateDate(year(now()), 7, 1);
			break;
		case 4:
			return CreateDate(year(now()), 10, 1);
			break;
	}
}