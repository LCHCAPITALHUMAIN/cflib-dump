function NumbersOnly(str) {
	return reReplace(str,"[^[:digit:]]","","all");
}