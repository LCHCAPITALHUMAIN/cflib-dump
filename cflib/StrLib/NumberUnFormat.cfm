function NumberUnFormat(inStr) {
	var outNum = 0;
	var default_value = inStr;

	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	outNum = REReplace(inStr,"[^0-9\.\-]",'','ALL');
	if (Len(outNum) LT 1) {
		outNum = default_value;
	}

	return outNum;
}