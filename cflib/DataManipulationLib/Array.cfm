function Array() {
	var result = ArrayNew(1);
	var to = ArrayLen(arguments);
	var i = 0;
	for (i=1; i LTE to; i=i+1)
		result[i] = Duplicate(arguments[i]);
	return result;
}