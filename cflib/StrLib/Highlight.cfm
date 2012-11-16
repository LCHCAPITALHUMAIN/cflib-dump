function highLight(source,lookfor) {
	var tmpOn       = "[;;^";
	var tmpOff      = "^;;]";
	var hilightitem	= "<SPAN STYLE=""background-color:yellow;"">";
	var endhilight  = "</SPAN>";
	var matchCase   = false;
	var obracket    = "";
	var tmps		= "";
	var stripperRE  = "";
	var badTag		= "";
	var nextStart	= "";
	
	if(ArrayLen(arguments) GTE 3) hilightitem = arguments[3];
	if(ArrayLen(arguments) GTE 4) endhilight  = arguments[4];
	if(ArrayLen(arguments) GTE 5) matchCase   = arguments[5];
	if(NOT matchCase) 	source = REReplaceNoCase(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	else 				source = REReplace(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	obracket   = find("<",source);
	stripperRE = "<.[^>]*>";	
	while(obracket){
		badTag = REFindNoCase(stripperRE,source,obracket,1);
		if(badTag.pos[1]){
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOn#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOff#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			nextStart = badTag.pos[1] + badTag.len[1];
		}
		else nextStart = obracket + 1;
		obracket = find("<",source,nextStart);
	}
	source = Replace(source,tmpOn,hilightitem,"ALL");
	source = Replace(source,tmpOff,endhilight,"ALL");
	return source;
}