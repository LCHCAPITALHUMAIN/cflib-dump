function parseEuroDate(euroDate){
	//grab the old locale, so we can switch it back
	var oldLocale = getLocale();
	//a var to hold our dateTime
	var dateTime = "";
	//set the locale to British -- they use the Euro format!
	setLocale("English (UK)");
	//parse it using the localization function for parsing date time
	dateTime = LSParseDateTime(arguments.euroDate);
	//now set the Locale back, so we don't mess up the server
	setLocale(oldLocale);
	//return our dateTime that was parsed
	return dateTime;
}