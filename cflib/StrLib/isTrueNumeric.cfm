function isTrueNumeric(str) {
	return reFind("[^0-9]", str) is 0;
}