function secondsToEnglish(iSeconds) {
	var szPlural = "";
	var iTime = "";
	var szUpdate = "";
	
	if (iSeconds LTE 0) iSeconds=1;
	iTime=iSeconds \ 86400;
	if (iTime GT 0) {
		if (iTime GT 1) szPlural = 's';
		szUpdate = "#iTime# day#szPlural#";  // Days
	} else {
		iTime=iSeconds \ 3600;
		if (iTime GT 0) {
			if (iTime GT 1) szPlural = 's';
			szUpdate = "#iTime# hour#szPlural#"; // Hours
		} else {
			iTime=iSeconds \ 60;
			if (iTime GT 0) {
				if (iTime GT 1) szPlural = 's';
				szUpdate = "#iTime# minute#szPlural#"; // Minutes
			} else {
				iTime=iSeconds;
				if (iTime NEQ 1) szPlural = 's';
				szUpdate = "#iTime# second#szPlural#"; // Seconds
			}
		}
	}
	return szUpdate;
}