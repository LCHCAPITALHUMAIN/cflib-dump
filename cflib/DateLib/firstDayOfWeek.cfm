function firstDayOfWeek(date) {
	var dow = "";
	var dowMod = "";
	var dowMult = "";
	var firstDayOfWeek = "";
	date = trim(arguments.date);
	dow = dayOfWeek(date);
	dowMod = decrementValue(dow);
	dowMult = dowMod * -1;
	firstDayOfWeek = dateAdd("d", dowMult, date);
	
	return firstDayOfWeek;
}