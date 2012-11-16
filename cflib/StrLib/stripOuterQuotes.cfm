function stripOuterQuotes(string) {
	if (left(string, 1) EQ """") {
		string = right(string, len(string) -1);
	}
	if (right(string, 1) EQ """") {
		string = left(string, len(string) -1);
	}
	return string;
}