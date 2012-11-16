function isUpperLower(character) {
	if(asc(character) gte 65 and asc(character) lte 90) return "upper";
	else if(asc(character) gte 97 and asc(character) lte 122) return "lower";
 	return "Not Alpha"; 
}