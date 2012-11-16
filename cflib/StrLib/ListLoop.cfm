function ListLoop(theList, theEval) {
	var i             = 0;
	var theList_len   = 0;
	var x             = "";

	var theDelim      = ",";
	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	theList_len   = ListLen(theList, theDelim);

	for (i=1; i LTE theList_len; i=i+1) {
		x = ListGetAt(theList, i, theDelim);
		theList = ListSetAt(theList, i, Evaluate(theEval), theDelim);
	}

	return theList;
}