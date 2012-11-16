function ListFormatted(theList, beginStr, endStr) {
	var theDelim = ",";
	if(ArrayLen(Arguments) GTE 4) theDelim = Arguments[4];

	return beginStr & Replace(theList, theDelim, endStr & beginStr, "ALL") & endStr;
}