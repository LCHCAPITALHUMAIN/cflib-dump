function getLeadingHtml(input, maxChars) {
	// token matches a word, tag, or special character
	var	token = "[[:word:]]+|[^[:word:]<]|(?:<(\/)?([[:word:]]+)[^>]*(\/)?>)|<";
	var	selfClosingTag = "^(?:[hb]r|img)$";
	var	output = "";
	var	charCount = 0;
	var	openTags = ""; var strPos = 0; var tag = "";
	var i = 1;

	var	match = REFind(token, input, i, "true");

	while ( (charCount LT maxChars) AND match.pos[1] ) {
		// If this is an HTML tag
		if (match.pos[3]) {
			output = output & Mid(input, match.pos[1], match.len[1]);
			tag = Mid(input, match.pos[3], match.len[3]);
			// If this is not a self-closing tag
			if ( NOT ( match.pos[4] OR REFindNoCase(selfClosingTag, tag) ) ) {
				// If this is a closing tag
				if ( match.pos[2] AND ListFindNoCase(openTags, tag) ) {
					openTags = ListDeleteAt(openTags, ListFindNoCase(openTags, tag)); 
				} else {
					openTags = ListAppend(openTags, tag);
				}
			}
		} else {
			charCount = charCount +  match.len[1];
			if (charCount LTE maxChars) output = output & Mid(input, match.pos[1], match.len[1]);
		}
		
		i = i + match.len[1];
		match = REFind(token, input, i, "true");
	}

	// Close any tags which were left open
	while ( ListLen(openTags) ) {
		output = output & "</" & ListLast(openTags) & ">";
		openTags = ListDeleteAt(openTags, ListLen(openTags));
	}

	if ( Len(input) GT Len(output) )
		output = output & "...";
	
	return output;
}