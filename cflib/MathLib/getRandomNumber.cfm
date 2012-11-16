function GetRandomNumber(length) {
	var i                 = "";
	var Seed              = "";
	var RandomNumber      = "";
	var ThisPart          = "";
	var TheTimeNow        = CreateODBCTime(Now());
	// change these values if you like
	var ThisStartTime     = CreateDateTime( Year(Now()), Month(Now()), Day(Now()), "09", "30", "00" );
	var ThisStopTime      = CreateDateTime( Year(Now()), Month(Now()), Day(Now()), "10", "00", "00" );
      
	// reseed only once every week between the specified start and stop times. In this case, if it's a tuesday between 9:30 and 10:00 in the morning.
	if(DayOfWeek(Now()) EQ 3 AND (TheTimeNow GTE ThisStartTime AND TheTimeNow LTE ThisStopTime)){
		// use just the numeric portions (or at least the last nine digits) of a UUID as a "random" seed
		Seed = Right(ReReplaceNoCase(CreateUUID(),"[A-F,\-]","","ALL"),9);
		Randomize(Seed);
	}

	// The use of NumberFormat in the following while loop assures the possiblity of having numbers which contain multiple consecutive zeros
	while (length){
		if(length GT 8){
			ThisPart = RandRange(0,99999999);
			ThisPart = NumberFormat(ThisPart,RepeatString("0",8));
			RandomNumber = RandomNumber & ThisPart;
			length = length - Len(ThisPart);
		} else {
			ThisPart = RandRange(0,RepeatString("9",length));
			ThisPart = NumberFormat(ThisPart,RepeatString("0",length));
			RandomNumber = RandomNumber & ThisPart;
			length = length - Len(ThisPart);
		}
	}
	return RandomNumber;
}