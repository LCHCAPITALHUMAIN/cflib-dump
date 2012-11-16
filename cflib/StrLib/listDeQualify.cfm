function listDeQualify(lst) {
	// the chr()s are the MS single and double quotes
	var qualifiers="',"",#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(8220)#,#chr(8221)#,#chr(8216)#,#chr(8217)#";
	var workList="";
	var delim=",";
	var listElement="";
	var firstChar="";
	var lastChar="";
	var i = 1;
	
	// if delim specified...
	if (arraylen(arguments) eq 2) delim=arguments[2];

	// loop the list, pull the first and last char from each element to evaluate
	for (;i lte listlen(lst,delim);i=i+1) {
		listElement=trim(listgetat(lst,i,delim));
		firstChar=left(ListElement,1);
		lastChar=Right(ListElement,1);
		
		if (listFindNoCase(qualifiers,firstChar) ) {ListElement=right(ListElement,len(ListElement)-1);}
		if (listFindNoCase(qualifiers,lastChar) ) {ListElement=left(ListElement,len(ListElement)-1);}
		workList=listappend(workList,listElement,delim);
	}
	return workList;
}