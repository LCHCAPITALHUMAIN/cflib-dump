function tagStripper(str) {
	var i = 1;
	var action = 'strip';
	var tagList = '';
	var tag = '';
	
	if (ArrayLen(arguments) gt 1 and lcase(arguments[2]) eq 'preserve') {
		action = 'preserve';
	}
	if (ArrayLen(arguments) gt 2) tagList = arguments[3];

	if (trim(lcase(action)) eq "preserve") {
		// strip only those tags in the tagList argument
		for (i=1;i lte listlen(tagList); i = i + 1) {
			tag = listGetAt(tagList,i);
			str = REReplaceNoCase(str,"</?#tag#.*?>","","ALL");
		}
	} else {
		// strip all, except those in the tagList argument
		// if there are exclusions, mark them with NOSTRIP
		if (tagList neq "") {
			for (i=1;i lte listlen(tagList); i = i + 1) {
				tag = listGetAt(tagList,i);
				str = REReplaceNoCase(str,"<(/?#tag#.*?)>","___TEMP___NOSTRIP___\1___TEMP___ENDNOSTRIP___","ALL");
			}
		}
		// strip all remaining tsgs.  This does NOT strip comments
		str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
		// convert unstripped back to normal
		str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
		str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
	}
	
	return str;	
}