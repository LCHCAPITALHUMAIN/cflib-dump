function listTrim(ThisList) {
	var i = 0;
	var ThisDelimiter = ",";
	var ThisListItem = "";
	var ThisTrimmedList = "";
		
	// check for passed delimiter
	if(ArrayLen(Arguments) EQ 2){
		ThisDelimiter = Arguments[2];
	}
	for(i = 1; i LTE ListLen(ThisList,ThisDelimiter); i = i + 1){
		ThisListItem	= Trim(ListGetAt(ThisList,i,ThisDelimiter));
		ThisTrimmedList = ListAppend(ThisTrimmedList,ThisListItem,ThisDelimiter);
	}
	return ThisTrimmedList;
}