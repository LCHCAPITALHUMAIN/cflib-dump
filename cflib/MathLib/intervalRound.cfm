function intervalRound(nNumber, nInterval){
	var nMultipler = fix(nNumber / nInterval); // How many times does the interval go into intNumber
	var bOption = 0;

	if(arrayLen(arguments) GTE 3 AND arguments[3])
		if(((nNumber mod nInterval) / nInterval) gte .5) bOption = 1; // Calculate percentage for rounding option.

	return (nInterval * nMultipler) + (bOption * nInterval);
}