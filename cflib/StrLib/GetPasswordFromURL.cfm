function GetPasswordFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no password   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("[^:]*:([^@]*@)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("[^:]*:([^@]*@)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[2], re_found_struct.len[2]-1);
	} else {
		return "";
	}
}