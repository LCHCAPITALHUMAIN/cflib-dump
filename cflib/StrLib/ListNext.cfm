function ListNext(currentItem, theList){
	var current_pos   = 0;
	var theDelim      = ",";

	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	current_pos = ListFind(theList, currentItem, theDelim);

	if(current_pos eq ListLen(theList, theDelim)) return ListFirst(theList, theDelim) ;
	else return ListGetAt(theList, current_pos+1, theDelim);
}