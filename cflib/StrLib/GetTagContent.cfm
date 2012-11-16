function getTagContent(tag,str) {
	var matchStruct = structNew();
	var startTag = "<#tag#[^>]*>";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	matchStruct = REFindNoCase(startTag,str,1,"true");
	if(matchStruct.len[1] eq 0 ) return ""; 
	endTagStart = REFindNoCase(endTag,str,matchStruct.pos[1],"false");
	return Mid(str,matchStruct.pos[1]+matchStruct.len[1],endTagStart-matchStruct.pos[1]-matchStruct.len[1]);
}