function ozPhoneFormatPlus(phoneNumber){
	//REGX to find chrs thats are not numbers or <spaces>
	var re = "[^0-9\.[:space:]]";
	//Allowed 2nd numbers in an Ausie Phone number starting in zero
	var allowedNumbers = "2,3,4,5,7,8";
	//2nd digit in the string
	var current2ndNumber = mid( replace( trim(phoneNumber), " ", "" ), 2, 1 );

	//Numbers and spaces are ok
	if(reFindNoCase(re, trim(phoneNumber))) return false;
	
	//Remove spaces and count len must be less than or equal 10
	if(len( replace( trim(phoneNumber), " ", "" ) ) gt 10) return false;
	
	//If the number starts with a zero then it must have a 2,3,4,7,8 as the next digit
	if (left ( replace( trim(phoneNumber), " ", "" ), 1 ) eq 0 and not listFind( allowedNumbers, current2ndNumber ) ) return false;
	
	//If we got here then we must be ok
	return true;
}