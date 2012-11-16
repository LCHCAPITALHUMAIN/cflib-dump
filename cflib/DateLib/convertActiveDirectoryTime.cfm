function convertActiveDirectoryTime(adTime) {
	var retVal = structNew();
	var tempTime = arguments.adTime / (60*10000000);
	retVal.ts = DateAdd('n',tempTime,'1/1/1601');
	retVal.ts = DateConvert("utc2Local", retVal.ts );
	retVal.date = Dateformat(retVal.ts,'mm/dd/yyyy');
	retVal.time = Timeformat(retVal.ts,'HH:mm');
	return retVal;
}