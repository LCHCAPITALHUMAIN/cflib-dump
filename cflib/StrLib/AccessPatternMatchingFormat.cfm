function AccessPatternMatchingFormat(string) {
	return ReplaceList(string, "[,%,_,##", "[[],[%],[_],[##]");
}