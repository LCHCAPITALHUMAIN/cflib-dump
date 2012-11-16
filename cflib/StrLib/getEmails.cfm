function getEmails(str) {
	var email = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.((aero|coop|info|museum|name|jobs|travel)|([a-z]{2,3})))";
	var res = "";
	var marker = 1;
	var matches = "";
	
	matches = reFindNoCase(email,str,marker,marker);

	while(matches.len[1] gt 0) {
		res = listAppend(res,mid(str,matches.pos[1],matches.len[1]));
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(email,str,marker,marker);		
	}
	return res;
}