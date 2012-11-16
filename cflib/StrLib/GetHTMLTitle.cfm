function GetHTMLTitle(str) {
	var matchStruct = reFindNoCase("<[[:space:]]*title[[:space:]]*>([^<]*)<[[:space:]]*/title[[:space:]]*>",str,1,1);
	if(arrayLen(matchStruct.len) lt 2) { writeoutput("error<BR>");return ""; }
	return Mid(str,matchStruct.pos[2],matchStruct.len[2]);	
}