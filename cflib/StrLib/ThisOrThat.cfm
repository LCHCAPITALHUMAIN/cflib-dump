function ThisOrThat(thisValue) {
	var defaultValue = "&nbsp;";
	if(arrayLen(arguments) gte 2) defaultValue = arguments[2];
	if (Len(Trim(thisValue)) LT 1) return defaultValue;
	return thisValue;
}