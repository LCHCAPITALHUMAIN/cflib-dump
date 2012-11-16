function RoundIt(num,digits) {
	var i = num;
	// multiply by 10 to the power of the number of digits to be preserved
	i = i * (10 ^ digits);
	// round off to an integer
	i = Round(i);
	// divide by 10 to the power of the number of digits to be preserved
	i = i / (10 ^ digits);
	// return the result
	return i;
}