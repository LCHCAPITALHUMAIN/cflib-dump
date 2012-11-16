function isPostalCodeBR(str) {
	return REFind("^[[:digit:]]{5}( |-)?[[:digit:]]{3}$", str) gte 1;
}