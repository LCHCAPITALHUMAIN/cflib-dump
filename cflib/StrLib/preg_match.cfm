function preg_match(regex,str) {
	var results = arraynew(1);
	var match = "";
	var x = 1;
	if (REFind(regex, str, 1)) { 
		match = REFind(regex, str, 1, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x] = mid(str, match.pos[x], match.len[x]);
			else
				results[x] = '';
		}
	}
	return results;
}