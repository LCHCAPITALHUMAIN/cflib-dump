function stripFont(str) {
	//remove the open font tag
	var returnStr = reReplaceNoCase(str,"(<font)[^>]*>","","all");
	//remove the close font tag
	returnStr = replaceNoCase(returnStr,"</font>","","all");
	//return the stripped string
	return returnStr;
}