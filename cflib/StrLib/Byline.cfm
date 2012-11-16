function Byline(names) {
	// Initialise
	var i = 0;
	var name = "";
	var bylineString = "";
	var edited = FALSE;
	var extrasMode = "none";
	if (ArrayLen(Arguments) GT 1) {
		edited = Arguments[2];
	}
	if (ArrayLen(Arguments) GT 2) {
		extrasMode = Arguments[3];
	}
	// Loop through names
	if (ListLen(names)) {
		for (i=1; i LTE ListLen(names); i=i+1) {
			name = ListGetAt(names, i);
			// Edited?
			if (edited) {
				name = "#name# (ed.)";
			}
			// Perform extras
			switch (extrasMode) {
				case "imdb": {
					name = "<a href=""http://uk.imdb.com/Name?#Replace(name,' ','+','ALL')#"" title=""check for information on this person on the Internet Movie Database"">#name#</a>";
					break;
				}
			}
			if (i EQ 1) {
				bylineString = "by #name#";
			} else if (i EQ ListLen(names)) {
				bylineString = "#bylineString# &amp; #name#";
			} else {
				bylineString = "#bylineString#, #name#";
			}
		}
	}
	return bylineString;
}