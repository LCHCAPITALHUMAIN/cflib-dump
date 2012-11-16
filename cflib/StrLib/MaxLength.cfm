function maxLength(string, length) {
	var padding = 3;
	var tmp = "...";	
		
	if ( len(string) gte length )
		return removeChars(trim(string), length, len(string) - padding) & tmp;
	else return string;
}