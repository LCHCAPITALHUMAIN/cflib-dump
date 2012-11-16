function ArrayConcat(a1, a2){
	var i=1;
	if ((NOT IsArray(a1)) OR (NOT IsArray(a2))) {
		writeoutput("Error in <Code>ArrayConcat()</code>! Correct usage: ArrayConcat(<I>Array1</I>, <I>Array2</I>) -- Concatenates Array2 to the end of Array1");
		return 0;
	}
	for (i=1;i LTE ArrayLen(a2);i=i+1) {
		ArrayAppend(a1, Duplicate(a2[i]));
	}
	return a1;
}