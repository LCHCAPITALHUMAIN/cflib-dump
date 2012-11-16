function ArrayAppendUnique(a1,val) {
	if ((NOT IsArray(a1))) {
		writeoutput("Error in <Code>ArrayAppendUnique()</code>! Correct usage: ArrayAppendUnique(<I>Array</I>, <I>Value</I>) -- Appends <em>Value</em> to the array if <em>Value</em> does not already exist");
		return 0;
	}
	if (NOT ListFind(Arraytolist(a1), val)) {
		arrayAppend(a1, val);
	}
	return a1;
}