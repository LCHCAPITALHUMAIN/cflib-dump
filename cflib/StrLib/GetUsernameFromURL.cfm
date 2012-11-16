function GetUsernameFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	var num_expressions  = 0;
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no username (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		num_expressions = ArrayLen(re_found_struct.pos);
		if(re_found_struct.pos[num_expressions] is 0) num_expressions = num_expressions - 1;
		return Mid(this_url, re_found_struct.pos[num_expressions], re_found_struct.len[num_expressions]-1);
	} else {
		return "";
	}
}