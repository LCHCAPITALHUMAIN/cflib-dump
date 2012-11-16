function splitUrl(inUrl) {
	var s = inUrl;
	var refUrl = "";
	var refQS = "";
	var refAnchor = "";
	var st = structNew();
	var i = find("?", s);
	
	if (i) {
		refUrl = left(s, i-1);
		refQS = mid(s, i+1, 99999);
		i = find("##", refQS);
		if (i) {
			refAnchor = mid(refQS, i+1, 99999);
			refQS = left(refQS, i-1);
		} else {
		refAnchor = "";
		}
	} else {	
		i = find("##", s);
		if (i) {
			refUrl = left(s, i-1);
			refAnchor = mid(s, i+1, 99999);
		} else {
			refUrl = s;
		}
	}
	
	st.url = refUrl;
	st.queryString = refQS;
	st.anchor = refAnchor;
	
	return st;
}