function getLinks(BodyText){
	var objLinks = StructNew();
	var objIndex = StructNew();
	var arrLink = ArrayNew(1);
	var arrDesc = ArrayNew(1);
	var nextMatch = 1;
	var Counter = 1;
	do { /* find opening anchor tag. */
		objMatch = REFindNoCase("<(A|FRAME)[[:space:]]+[^>]*(HREF|SRC) ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", BodyText, nextMatch, true);
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GTE 4) {
			thisURL = Mid(BodyText, objMatch.pos[4], objMatch.len[4]);
			thisTag = Mid(BodyText, objMatch.pos[2], objMatch.len[2]);
			if (CompareNoCase(thisTag, "A") EQ 0) {
				descEnd = FindNoCase("</A>", BodyText, nextMatch);
				thisDesc = Mid(BodyText, nextMatch, descEnd - nextMatch);
				nextMatch = descEnd + 4;
			} else { /* get the frame name */
				fullTag = Mid(BodyText, objMatch.pos[1], objMatch.len[1]);
				frameName = "";
				objFrame = REFindNoCase("NAME ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", fullTag, 1, true);
				if (ArrayLen(objFrame.pos) GT 1) {
					frameName = Mid(fullTag, objFrame.pos[2], objFrame.len[2]);
				}
				thisDesc = "FRAME: " & frameName;
			}
			StructInsert(objIndex, thisDesc, Counter, true);
			arrLink[Counter] = thisURL;
			arrDesc[Counter] = thisDesc;
			Counter = Counter + 1;
		}
	} while (nextMatch NEQ 0);
	StructInsert(objLinks, "index", objIndex);
	StructInsert(objLinks, "link", arrLink);
	StructInsert(objLinks, "desc", arrDesc);
	return objLinks;
}