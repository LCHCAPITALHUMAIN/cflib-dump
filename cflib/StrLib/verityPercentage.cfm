function verityPercentage(num){
	var outNum = '';
	var leftDigit=ListFirst(num, '.');
	var rightDigits=Left(ListGetAt(num, 2, '.'), 2);
	
	if (right(rightDigits, 2) GTE 5) rightDigits = rightDigits+1;

	if (leftDigit gte 1) outNum='100' & '%';
	else outNum=RightDigits & '%';
	
	return outNum;
}