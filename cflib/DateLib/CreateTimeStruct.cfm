function CreateTimeStruct(timespan) {
    var timestruct = StructNew();
    var mask = "s";

    if (ArrayLen(Arguments) gte 2) mask = Arguments[2];

	// if timespan isn't an integer, convert mask towards s until timespan is an integer or mask is s
	while (Int(timespan) neq timespan AND mask neq "s") {
		if (mask eq "d") {
			timespan = timespan * 24;
			mask = "h";
		} else if (mask eq "h") {
			timespan = timespan * 60;
			mask = "m";
		} else if (mask eq "m") {
			timespan = timespan * 60;
			mask = "s";
		}
	}
	
	// only 4 allowed values for mask - if not one of those, return blank struct
	if (ListFind("d,h,m,s", mask)) {
		// compute seconds
		if (mask eq "s") {
			timestruct.s = (timespan mod 60) + (timespan - Int(timespan));
			timespan = int(timespan/60);
			mask = "m";
		} else timestruct.s = 0;
		// compute minutes
		if (mask eq "m") {
			timestruct.m = timespan mod 60;
			timespan = int(timespan/60);
			mask = "h";
		} else timestruct.m = 0;
		// compute hours, days
		if (mask eq "h") {
			timestruct.h = timespan mod 24;
			timestruct.d = int(timespan/24);
		} else {
			timestruct.h = 0;
			timestruct.d = timespan;
		}
	}
	
	return timestruct;
}