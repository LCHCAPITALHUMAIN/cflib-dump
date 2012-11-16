function ActivateURL(string) {
	var nextMatch = 1;
	var objMatch = "";
	var outstring = "";
	var thisURL = "";
	var thisLink = "";
	var	target = IIf(arrayLen(arguments) gte 2, "arguments[2]", DE(""));
	var paragraph = IIf(arrayLen(arguments) gte 3, "arguments[3]", DE("false"));
	
	do {
		objMatch = REFindNoCase("(((https?:|ftp:|gopher:)\/\/)|(www\.|ftp\.))[-[:alnum:]\?%,\.\/&##!;@:=\+~_]+[A-Za-z0-9\/]", string, nextMatch, true);
		if (objMatch.pos[1] GT nextMatch OR objMatch.pos[1] EQ nextMatch) {
			outString = outString & Mid(String, nextMatch, objMatch.pos[1] - nextMatch);
		} else {
			outString = outString & Mid(String, nextMatch, Len(string));
		}
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GT 1) {
			// If the preceding character is an @, assume this is an e-mail address
			// (for addresses like admin@ftp.cdrom.com)
			if (Compare(Mid(String, Max(objMatch.pos[1] - 1, 1), 1), "@") NEQ 0) {
				thisURL = Mid(String, objMatch.pos[1], objMatch.len[1]);
				thisLink = "<A HREF=""";
				switch (LCase(Mid(String, objMatch.pos[2], objMatch.len[2]))) {
					case "www.": {
						thisLink = thisLink & "http://";
						break;
					}
					case "ftp.": {
						thisLink = thisLink & "ftp://";
						break;
					}
				}
				thisLink = thisLink & thisURL & """";
				if (Len(Target) GT 0) {
					thisLink = thisLink & " TARGET=""" & Target & """";
				}
				thisLink = thisLink & ">" & thisURL & "</A>";
				outString = outString & thisLink;
				// String = Replace(String, thisURL, thisLink);
				// nextMatch = nextMatch + Len(thisURL);
			} else {
				outString = outString & Mid(String, objMatch.pos[1], objMatch.len[1]);
			}
		}
	} while (nextMatch GT 0);
		
	// Now turn e-mail addresses into mailto: links.
	outString = REReplace(outString, "([[:alnum:]_\.\-]+@([[:alnum:]_\.\-]+\.)+[[:alpha:]]{2,4})", "<A HREF=""mailto:\1"">\1</A>", "ALL");
		
	if (paragraph) {
		outString = ParagraphFormat(outString);
	}
	return outString;
}