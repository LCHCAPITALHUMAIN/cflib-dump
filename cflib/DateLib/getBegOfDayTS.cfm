function getBegOfDayTS(date) {
	var vDate = date;	
	vDate = dateFormat(vDate, 'MM/DD/YYYY');
	vDate = DateAdd("h",00,vDate);
	vDate = DateAdd("n",00,vDate);
	vDate = DateAdd("s",00,vDate);
	
	return vDate;
}