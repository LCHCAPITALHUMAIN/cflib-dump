function preg_match_all(regex,str) {
	var results = arraynew(2);
	var pos = 1;
	var loop = 1;
	var match = "";
	var x= 1;
	
	while (REFind(regex, str, pos)) { 
		match = REFind(regex, str, pos, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x][loop] = mid(str, match.pos[x], match.len[x]);
			else
				results[x][loop] = '';
		}
		pos = match.pos[1] + match.len[1];
		loop = loop + 1;
	}
	return results;
}