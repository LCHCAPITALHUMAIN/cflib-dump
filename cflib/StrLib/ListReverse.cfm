function ListReverse(list) {

	var newlist = "";
	var i = 0;
	var delims = "";
	var thisindex = "";
	var thisitem = "";
	
	var argc = ArrayLen(arguments);
	if (argc EQ 1) {
		ArrayAppend(arguments,',');
	}
	delims = arguments[2];
	while (i LT listlen(list,delims))
	{	
	thisindex = listlen(list,delims)-i;
	thisitem = listgetat(list,thisindex,delims);
    newlist = listappend(newlist,thisitem,delims);
    i = i +1;
	}
 return newlist;
}