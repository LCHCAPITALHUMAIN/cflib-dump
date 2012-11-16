function ArrayInsertArrayAt(a1, a2, pos) {
	var aNew = ArrayNew(1);
	var len1 = "";
	var len2 = "";
	var i = 1;
	if ((NOT isArray(a1)) OR (NOT isArray(a2)) OR (NOT IsNumeric(pos)) OR (pos LT 1) OR (pos GT ArrayLen(a1) +1) )  {
		writeoutput("Error in <Code>ArrayInsertArrayAt()</code>! Correct usage: ArrayInsertArrayAt(<I>Array1</I>, <I>Array2</I>,
<I>position</I>) -- Inserts <I>Array2</I> at <I>position</I> in
<I>Array2</I>");
		return 0;
	}
	pos=int(pos);
	len1=ArrayLen(a1);
	len2=ArrayLen(a2);
	aNew=Duplicate(a1);
	if (pos IS NOT Len1 + 1) {
		for (i=0; i LT len2; i=i+1) ArrayInsertAt(aNew, pos + i, Duplicate(a2[i+1]));
	}
	else {
		for (i=1;i LTE len2;i=i+1) ArrayAppend(aNew, Duplicate(a2[i]));
	}	
	return aNew;
}