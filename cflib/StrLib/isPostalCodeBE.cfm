function isPostalCodeBE(str) {
	// Postal codes cannot start with 0
	return REFind("[1-9][[:digit:]]{3}", arguments.str) gte 1;
}