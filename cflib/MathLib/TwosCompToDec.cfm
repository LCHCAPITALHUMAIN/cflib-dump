function TwosCompToDec(num, bits){
	var isNegative = 0;
	var varBase10 = num;
	var varBase2 = 0;
	var varBase2Rev = "";  
	var strLen=0;
  
	// capture whether or not the input value is negative
	if (varBase10 LT 0) {
		isNegative = 1;
		varBase10 = abs(varBase10);
	}
	
	// convert to base 2
	varBase2 = NumberFormat(Right(FormatBaseN(varBase10,2), bits), RepeatString("0", bits));
	
	// switch sign bit to 0
	varBase2 = "0" & Right(varBase2, (bits - 1));

	if(isNegative) {
		// if the number was negative, we have to invert the value and add one
		
		// invert; swap 0 for 1 and 1 for 0
		strLen = len(varBase2);
		for(i=1; i LE bits; i=i+1){
			if(Mid(varBase2, i, 1) eq 0) {
				varBase2Rev = varBase2Rev & 1;
			} else {
				varBase2Rev = varBase2Rev & 0;
			}
		}

		// convert back to base 10
		varBase10 = InputBaseN(varBase2Rev, 2);
		
		//add 1
		return (varBase10 + 1);

	} else {
		// if number was positive, convert straight back to base 10
		return InputBaseN(varBase2, 2);
	}
}