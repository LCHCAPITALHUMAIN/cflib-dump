function IntegerRankFormat(number){
	//grab the last digit
	var lastDigit = right(number,1);
	//grab the last two digits
	var lastTwoDigits = right(number,2);
	//use numberFormat() to put in commas for number larger than 999
	number = numberFormat(number);
	//11, 12, and 13 are special cases, so deal with them
	switch(lastTwoDigits){
		case 11:{
			return number & "th";
		}
		case 12:{
			return number & "th";
		}
		case 13:{
			return number & "th";
		}
	}
	//append the correct suffix based on the last number
	switch(lastDigit){
		case 1:{
			return number & "st";
		}
		case 2:{
			return number & "nd";
		}
		case 3:{
			return number & "rd";
		}
		default:{
			return number & "th";
		}
	}
}