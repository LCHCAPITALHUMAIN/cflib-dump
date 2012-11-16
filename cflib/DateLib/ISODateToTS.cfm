function ISODateToTS(str) {
	// time formats have 2 ways of showing themselves: 1994-11-05T13:15:30Z UTC format OR 1994-11-05T08:15:30-05:00
	var initialDate		= parseDateTime(REReplace(arguments.str, "(\d{4})-?(\d{2})-?(\d{2})T([\d:]+).*", "\1-\2-\3 \4"));
	var timeModifier	= "";
	var multiplier		= 0;

	// If not in UTC format then we need to offset the time
	if (right(arguments.str, 1) neq "Z") {
		//Now we determine if we are adding or deleting the the time modifier.
		if (arguments.str contains '+' and listlen(listrest(arguments.str, "+"), ":") eq 2){
			timeModifier = listRest(arguments.str,"+");
			multiplier = 1; // Add
		} else if (listlen(listLast(arguments.str,"-"),":") eq 2) {
			timeModifier = listLast(arguments.str,"-");
			multiplier = -1; // Delete
		}
		if (len(timeModifier)){
			initialDate = dateAdd("h", val(listFirst(timeModifier, ":"))*multiplier, initialDate);
			initialDate =  dateAdd("n", val(listLast(timeModifier, ":"))*multiplier, initialDate);
		}
	}
	return initialDate;
}