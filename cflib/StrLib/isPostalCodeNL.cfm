function isPostalCodeNL (str) {
	//postal codes consists of 4 digits, folowed by one space and two alphas
	return reFind("[1-9][[:digit:]]{3}[ ]?[[:alpha:]]{2}", arguments.str) gte 1;
}