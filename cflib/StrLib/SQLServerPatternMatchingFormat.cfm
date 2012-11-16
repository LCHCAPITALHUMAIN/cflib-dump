function SQLServerPatternMatchingFormat(string) {
	return ReplaceList(string, "[,%,_", "[[],[%],[_]");
}