function weekNumsInMonth(month,year) {
	var fakedate = createDate(year,month,1);
	var firstWeek = week(fakedate);
	var lastweek = week(createDate(year,month,daysInMonth(fakedate)));
	var i="";
	var aWeek = arrayNew(1);
	for(i=firstWeek;i lte lastWeek;i=i+1) {
		arrayAppend(aWeek, i);
	}
	return aWeek;
 }