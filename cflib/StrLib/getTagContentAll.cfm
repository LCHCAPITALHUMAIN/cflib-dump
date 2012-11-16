function getTagContentAll(tag,str) {
	var matchStruct = structNew();
	var matchPos = "";
	var matchLen = "";
	var startTag = "<#lcase(tag)#";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	var firstOcc = REFindNoCase(startTag,str,1,true);
	var returnArray = ArrayNew(1);

	//check the char following the tag - if it closes the tag then set the startTag accordingly
	if(mid(str, firstOcc.pos[1]+len(startTag),1) eq ">") {
		startTag = "<#tag#>";
	} else {
	//there are attributes so the RE should accommodate
	//include a space following the tag name so that searching
	//for 'b' does not find 'b' and 'body', etc
	startTag = "<#tag# [^>]*>";
	}

	matchStruct = REFindNoCase(startTag,str,1,"true");
	matchPos = matchStruct.pos [1];
	matchLen = matchStruct.len[1];
	
	if(matchLen eq 0) return returnArray;
	endTagStart = REFindNoCase(endTag,str,matchPos,"false");
	//if no end tag exists return out
	if(endTagStart eq 0) return returnArray;

	ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));

	while (matchLen neq 0) {
		matchStruct = REFindNoCase(startTag,str,matchPos+matchLen,"true");
		matchPos = matchStruct.pos [1];
		matchLen = matchStruct.len[1];
		if(matchLen eq 0) return returnArray;
		endTagStart = REFindNoCase(endTag,str,matchPos,"false");
		ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));
	}

	return returnArray;
}