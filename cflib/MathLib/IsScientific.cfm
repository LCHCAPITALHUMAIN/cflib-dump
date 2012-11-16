function IsScientific(inNum) {
	if(IsNumeric(inNum) AND (FindNoCase("E", inNum) OR FindNoCase("D",inNum))) return true;
	else return false;
}