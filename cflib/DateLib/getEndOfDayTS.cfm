function getEndOfDayTS(date) {
	var vDate = date;
	vDate = dateFormat(vDate, 'MM/DD/YYYY');
	vDate = DateAdd("h",23,vDate);
	vDate = DateAdd("n",59,vDate);
	vDate = DateAdd("s",59,vDate);
	
	return vDate;
}