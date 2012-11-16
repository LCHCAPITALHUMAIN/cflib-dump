function hoursMinutes(minutes) {
	var tempstr = "";
	var strHours = minutes / 60;
	var strMinutes = minutes MOD 60;
	var hourText = "";
	if (strHours gte 1) {
		if (strHours gte 2) {
			hourText = " hours ";
		} else {
			hourText = " hour ";
		}
		tempstr = Fix(strHours) & hourText;
	}
	
	if (strMinutes gt 0) {
		tempstr = tempstr & strMinutes & " minutes";
	}
	return tempstr;
}