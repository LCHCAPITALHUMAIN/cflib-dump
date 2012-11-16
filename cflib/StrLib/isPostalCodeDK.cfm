function isPostalCodeDK(str) {
	// The first numeric of the postal codes cannot start with 0
	return REFind("^[D-d][K-k]( |-)?[1-9]{1}[[:digit:]]{3}$", arguments.str) gte 1;
}