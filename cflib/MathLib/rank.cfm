function rank(value, set) {

	// Assume the value is in first place
	var ranking = 1;
	var i = 1;

	// Loop over each value in the set
	for (i = 1; i lte listlen(set); i=i+1 ) {
		// If this value in the set is greater, decrease the ordinal
		if ( listgetat(set, i) gt value ) ranking=ranking+1;
	}
	
	return ranking;
}