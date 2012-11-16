function TrimStruct(st) {
	var excludeList = "";
	var key = "";

	if(arrayLen(arguments) gte 2) excludeList = arguments[2];
	for(key in st) {
		if(not listFindNoCase(excludeList,key) and isSimpleValue(st[key])) st[key] = trim(st[key]);
	}
	return st;
}