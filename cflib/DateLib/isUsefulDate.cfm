function isUsefulDate(date){
	if(isDate(date)){
		if(abs(dateDiff("yyyy",date,now())) LTE 100)
			return true;
		else
			return false;
		}
	else
		return false;
}