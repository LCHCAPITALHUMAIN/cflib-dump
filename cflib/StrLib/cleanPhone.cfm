function cleanPhone(PhoneNum) {
	var thisCleanPhone ="";

	PhoneNum = ReReplace(trim(PhoneNum), "[^[:digit:]]", "", "all");
	
	// Trim away leading 1 in phone numbers.  No area codes start with 1 
	
	if (Left(Trim(PhoneNum),1) eq 1) {
      PhoneNum = Replace(PhoneNum,'1','');
	}

	thisCleanPhone = PhoneFormat(Left(PhoneNum,10));
	
	// if phone number is greater that 10 digits, use remaining digits as an extension
	
	if (len(trim(PhoneNum)) gt 10) {
		thisCleanPhone = thisCleanPhone &" x"& Right(PhoneNum,(len(trim(PhoneNum))-10));	
	}
	
	return trim(thisCleanPhone);

}