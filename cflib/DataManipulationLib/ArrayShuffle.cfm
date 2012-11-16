function ArrayShuffle(ar) {
	var ar1=ArrayNew(1);
	var i=1;
	var n=1;
	var len=ArrayLen(ar);
	if (NOT IsArray(ar,1)) {
		writeoutput("Error in <Code>ArrayShuffle()</code>! Correct usage: ArrayShuffle(<I>Array</I>) - Shuffles the values in one dimensional Array");
		return 0;
	}
	
	if (ArrayLen(ar) eq 0) {
		return ar1;
	}
	
	for (i=1; i lte len; i=i+1) {
		n = RandRange(1,ArrayLen(ar));
		ArrayAppend(ar1,ar[n]);
		ArrayDeleteAt(ar,n);
	}
	return ar1;
}